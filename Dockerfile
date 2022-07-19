FROM registry.gitlab.com/tomaso_gitlab/kouba_api:builder

RUN cargo build --target armv7-unknown-linux-gnueabihf --release
RUN cp /target/armv7-unknown-linux-gnueabihf/release/kouba_api /bin/kouba_api
RUN rm -rf /target
ENTRYPOINT "/bin/kouba_api"
