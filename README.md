# ReScript Project Template

## Development

Run the `Dockerfile-dev` docker image.
- Map the inner ports 3000 and 5000 to some ports on the host
- bind $ROOT/src to /app/src in the container
- run `./dev.sh`

If [docker compose](https://docs.docker.com/compose/) is installed then running

```sh
docker-compose -f docker-compose-dev.yaml up
```

will achieve the same.

It maps ports `3000` to `3000` and `5000` to `5000`

Point a browser to http://localhost:3000/

## Build

TODO
