# Multi-stage Dockerfile to serve the HTML report with minimal image size

# Build stage: just to copy the report
FROM alpine AS build
WORKDIR /app
COPY ./playwright-report /app

# Serve stage: use nginx to serve static files
FROM nginx:alpine
COPY --from=build /app /usr/share/nginx/html
EXPOSE 9323

HEALTHCHECK CMD curl --fail http://localhost:9323 || exit 1

CMD ["http-server", ".", "-p", "9323", "--no-dir-listing"]EXPOSE 9323