
FROM node:10.16-alpine
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json", "./"]
RUN npm install 
EXPOSE 4200