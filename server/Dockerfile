FROM node:18-alpine

WORKDIR /app

COPY package*.json .

RUN npm install

COPY ./server /app/server

CMD ["npm", "run", "back"]
