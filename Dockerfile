FROM 9d0a9724cf4347720e85c6d63f7c269333b27e9766c2181324f0213fdbc3d76b

RUN cargo build --release
RUN cp /target/*/release/kouba_api /bin/kouba_api
RUN rm -rf /target
ENTRYPOINT "/bin/kouba_api"
