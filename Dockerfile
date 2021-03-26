FROM node:alpine 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# from 0 represents its from above step
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html