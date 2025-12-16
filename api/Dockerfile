FROM rust:1.65-bullseye

WORKDIR /usr/src/app

COPY . .

RUN cargo build --release

EXPOSE 8080

CMD ["./target/release/api"]
