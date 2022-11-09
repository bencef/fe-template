FROM node:18.1.0-bullseye as builder

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci

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
