FROM debian:11-slim

RUN apt-get update
RUN apt-get install curl nodejs npm -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup default stable

RUN rustup target add wasm32-unknown-unknown

RUN cargo install cargo-generate --features vendored-openssl \
RUN cargo install cargo-run-script

RUN npm install -g @iboss/terrain