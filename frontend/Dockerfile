#build
FROM node:16.20.0-alpine3.18 as builder
WORKDIR /usr/src/app
COPY . .
RUN npm install \
    && npm run build

#release
FROM nginx:1.23-alpine
COPY --from=builder /usr/src/app/dist/frontend /usr/share/nginx/html
# COPY --from=builder /usr/src/app/nginx.tmpl /app/nginx.tmpl
EXPOSE 80