FROM node:18-alpine

WORKDIR /app

COPY package*.json .

COPY *.js .

RUN npm install

COPY ./src /app/src

RUN npm run build

CMD ["npm", "run", "front"]
