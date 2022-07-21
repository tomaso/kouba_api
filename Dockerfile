FROM ghcr.io/tomaso/kouba_api:builder
RUN cargo build --release


FROM alpine:latest
COPY --from=0 /target/release/kouba_api /bin/kouba_api
ENTRYPOINT "/bin/kouba_api"
