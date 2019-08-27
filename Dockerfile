FROM node:10.16-alpine
WORKDIR /usr/src/temp
COPY ["package.json", "package-lock.json", "./"]
RUN npm install 
EXPOSE 4200