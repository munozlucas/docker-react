FROM node:18.12.0-alpine3.15 as builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#cada from termina el anterior
FROM nginx:1.21.3-alpine
COPY --from=builder /app/build /usr/share/nginx/html
