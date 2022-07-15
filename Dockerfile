FROM alpine:latest

COPY target/x86_64-unknown-linux-musl/release/kouba_api /bin/kouba_api
ENTRYPOINT "/bin/kouba_api"
