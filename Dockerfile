FROM node:18.1.0-bullseye as builder

WORKDIR /app

RUN npm install -g rescript

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci

# TODO: Remove this once this is fixed upstream
RUN sed -i '/process_argv\[wsParamIndex/s/process_argv/delegate_args/' /app/node_modules/rescript/rescript

COPY . .

RUN npx rescript build
RUN npx webpack

FROM python:3.10-alpine

COPY --from=builder /app/dist /app

WORKDIR /app

# Heroku doesn't support EXPOSE
# EXPOSE 80

# Heroku needs CMD instead of ENTRYPOINT
CMD python -m http.server $PORT
