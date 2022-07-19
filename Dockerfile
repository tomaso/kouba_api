FROM registry.gitlab.com/tomaso_gitlab/kouba_api:builder

RUN rustup target add armv7-unknown-linux-gnueabihf
RUN cargo build --target armv7-unknown-linux-gnueabihf --release
RUN find / -iname kouba_api -type f
RUN ls -l /
RUN ls -l /target
RUN ls -l /target/armv7-unknown-linux-gnueabihf
RUN ls -l /target/armv7-unknown-linux-gnueabihf/release
RUN ls -l /target/armv7-unknown-linux-gnueabihf/release/kouba_api
COPY /target/armv7-unknown-linux-gnueabihf/release/kouba_api /bin/kouba_api
ENTRYPOINT "/bin/kouba_api"
