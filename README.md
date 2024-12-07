# wasm-pack

A `rust-node` based image installed with wasm-pack for projects

> WARNING: This is not a image to serve projects with! Consider it as a builder image. use multi-stage builds as stated below.

## Features

- node v22
- npm v10
- built in yarn & pnpm
- rust 1.83.0
- bash-sh aliasing for better CLI support for Docker Desktop

## Usage

To diploy a node site based on rust packages

```Dockerfile
FROM 15012002/wasm-pack as builder
WORKDIR /usr/app
copy . .
RUN cargo update && npm install
RUN wasm-pack build ./rust-proj && npm run build


FROM nginx:latest
COPY --from=builder /usr/app/dist /usr/share/nginx/html
```

> NOTE: The Dockerfile above wont work yet it is a fair demonstration of how it should be used.

### Troubleshooting

In case you get an error regarding wasm-opt, put the following in `cargo.toml`:

```toml
[package.metadata.wasm-pack.profile.release]
wasm-opt = false
```

This will remove any usage of `wasm-opt` and will complete build in most cases.
### handling CLI

This image comes with bash support out-of-the box.
Just click the `CLI` button in your docker desktop or via the command line:

```bash
 docker exec -it mycontainer sh
```

### Updating the image

- Contact the author to run the CI
