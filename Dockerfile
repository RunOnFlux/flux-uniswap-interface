# FROM node:14.19.1 as build
FROM node:14-slim
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app
COPY . .
RUN apt -y update && apt -y install git

RUN yarn
RUN yarn build

WORKDIR /app/build
RUN npm update -g serve
CMD yarn serve

EXPOSE 3000