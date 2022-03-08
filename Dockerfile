FROM node:16-alpine as builder

WORKDIR /usr/app

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build



# /usr/app/build 

FROM nginx 
COPY --from=builder /usr/app/build /usr/share/nginx/html

# default command of nginx is to start nginx