FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build

# /app/build is the folder that we want to serve

# we will use nginx to serve the build folder

FROM nginx

# copy the build folder from the previous stage

COPY --from=builder /app/build /usr/share/nginx/html