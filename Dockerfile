FROM 15012002/rust-node
LABEL maintainer="Matanel Gordon"
# install wasm-pack
RUN curl "https://rustwasm.github.io/wasm-pack/installer/init.sh" -fsS | bash
