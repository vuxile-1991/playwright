# Dockerfile to serve the HTML report
FROM node:18-alpine

WORKDIR /app

COPY ./playwright-report /app

RUN npm install -g http-server

# Create a non-root user and switch to it
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 9323

CMD ["http-server", ".", "-p", "9323"]