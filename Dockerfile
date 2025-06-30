# Dockerfile to serve the HTML report
FROM node:18-alpine

WORKDIR /app

RUN npm install -g http-server

EXPOSE 9323

CMD ["http-server", ".", "-p", "9323"]