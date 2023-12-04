FROM --platform=linux/amd64 node:alpine

WORKDIR /usr/src/app

COPY . . 

RUN npm install 

EXPOSE 8888

CMD ["npm", "run", "start"]



