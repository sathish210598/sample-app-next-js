FROM node:18.17.1-windowsservercore-ltsc2022

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000
CMD ["node", "app.js"]
