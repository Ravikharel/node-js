FROM node:16
WORKDIR /app
copy package.json ./
RUN npm install 
COPY . .
EXPOSE 3000
CMD ["npm","start"]