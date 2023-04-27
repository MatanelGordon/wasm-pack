# wasm-pack

A `rust-node` based image installed with wasm-pack for projects

> WARNING: This is not a image to serve projects with! Consider it as a builder image. use multi-stage builds as stated below.

## Features

- node v18
- npm v9
- built in yarn & pnpm
- rust 1.69.0
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

### handling CLI

This image comes with bash support out-of-the box.
Just click the `CLI` button in your docker desktop or via the command line:

```bash
 docker exec -it mycontainer sh
```