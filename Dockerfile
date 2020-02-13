FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/ngix/html # want to copy something from other phase