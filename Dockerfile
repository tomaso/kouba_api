FROM registry.gitlab.com/tomaso_gitlab/kouba_api:builder

RUN cargo build --target armv7-unknown-linux-gnueabihf --release
COPY target/x86_64-unknown-linux-musl/release/kouba_api /bin/kouba_api
ENTRYPOINT "/bin/kouba_api"
