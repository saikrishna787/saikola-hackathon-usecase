FROM node:20-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

# 7. Start the application
CMD ["node", "src/index.js"]