FROM node:10-alpine as build-step
RUN mkdir /app
WORKDIR /app
COPY package.json /app
RUN npm cache clean --force
RUN npm config set registry http://registry.npmjs.org/
RUN npm install
COPY . /app
RUN npm run build

# Stage 2
FROM nginx
COPY --from=build-step /app/build /usr/share/nginx/html