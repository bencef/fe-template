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

NOTE: port `5000` is used for the auto-reload websocket.

Point a browser to http://localhost:3000/

## Build

Use the Dockerfile called `Dockerfile` it is known to work with the Heroku container registry.

To run it locally on port `5000`:

```sh
# Build it
docker build -t fe-template .
# Run it in the foreground
docker run -e PORT=5000 -p 5000:5000 fe-template
```

NOTE: It won't write any output when it starts up
