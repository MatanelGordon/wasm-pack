FROM 15012002/rust-node:0.0.1
LABEL maintainer="Matanel Gordon"
# install wasm-pack
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
