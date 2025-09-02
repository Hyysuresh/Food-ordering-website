FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

FROM nginx:alpine


WORKDIR /usr/share/nginx/html


COPY --from=build /app ./


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
