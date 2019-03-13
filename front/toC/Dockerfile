FROM node:9.11.1-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --quiet

COPY . .

RUN npm rebuild

RUN npm install vue-cli -g

RUN npm run build

CMD ["npm", "run", "start"]

