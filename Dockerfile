FROM 15012002/rust-node:node-22-rust-1.83
LABEL maintainer="Matanel Gordon"
# install wasm-pack
RUN curl "https://rustwasm.github.io/wasm-pack/installer/init.sh" -fsS | bash
