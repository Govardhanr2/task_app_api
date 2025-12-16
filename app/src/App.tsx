import React, { Component, MouseEvent } from 'react';

const API_URL = process.env.REACT_APP_API_URL;

interface IAppState {
    addKey: string;
    addValue: string;
    fetchKey: string;
    fetchedValue: string;
    message: string;
}

class App extends Component<{}, IAppState> {
    constructor(props: any) {
        super(props);

        this.state = {
            addKey: '',
            addValue: '',
            fetchKey: '',
            fetchedValue: '',
            message: '',
        };
    }

    handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        const { id, value } = event.target;
        this.setState({ [id]: value } as Pick<IAppState, keyof IAppState>);
    };

    postKv = async (event: MouseEvent) => {
        this.setState({ message: '' }); // Clear previous messages
        const { addKey, addValue } = this.state;

        if (!addKey || !addValue) {
            this.setState({ message: 'Both key and value are required to add.' });
            return;
        }

        try {
            const resp = await fetch(`${API_URL}/`, {
                method: 'post',
                body: JSON.stringify({ key: addKey, value: addValue }),
                headers: {
                    'Content-Type': 'application/json',
                },
            });

            if (resp.ok) {
                this.setState({ message: `Successfully stored: ${addKey} - ${addValue}`, addKey: '', addValue: '' });
            } else {
                const errorText = await resp.text();
                this.setState({ message: `Error storing key-value pair: ${errorText}` });
            }
        } catch (error) {
            this.setState({ message: `Network error: ${error}` });
        }
    };

    getKv = async (event: MouseEvent) => {
        this.setState({ message: '', fetchedValue: '' }); // Clear previous messages and fetched value
        const { fetchKey } = this.state;

        if (!fetchKey) {
            this.setState({ message: 'Key is required to fetch.' });
            return;
        }

        try {
            const resp = await fetch(`${API_URL}/${fetchKey}`, {
                headers: {
                    'Content-Type': 'application/json',
                },
            });

            if (resp.ok) {
                const data = await resp.json();
                this.setState({ fetchedValue: data.value, message: `Successfully fetched value for key: ${fetchKey}` });
            } else if (resp.status === 404) {
                this.setState({ message: `Key '${fetchKey}' not found.` });
            }
            else {
                const errorText = await resp.text();
                this.setState({ message: `Error fetching key-value pair: ${errorText}` });
            }
        } catch (error) {
            this.setState({ message: `Network error: ${error}` });
        }
    };

    render() {
        const { addKey, addValue, fetchKey, fetchedValue, message } = this.state;

        return (
            <div>
                <p>add a key and value</p>
                <div>
                    <label htmlFor="addKey">key: </label>
                    <input type="text" id="addKey" value={addKey} onChange={this.handleInputChange} />
                </div>
                <div>
                    <label htmlFor="addValue">value: </label>
                    <input type="text" id="addValue" value={addValue} onChange={this.handleInputChange} />
                    <button onClick={this.postKv}>submit</button>
                </div>
                <hr />
                <p>fetch a value</p>
                <div>
                    <label htmlFor="fetchKey">key: </label>
                    <input type="text" id="fetchKey" value={fetchKey} onChange={this.handleInputChange} />
                    <button onClick={this.getKv}>submit</button>
                </div>
                <div>
                    <label htmlFor="fetchedValue">value: </label>
                    <strong><span id="fetchedValue">{fetchedValue}</span></strong>
                </div>
                {message && <p style={{ color: 'blue' }}>{message}</p>}
            </div>
        )
    }
}

export default App;
