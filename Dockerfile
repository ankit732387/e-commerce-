FROM ubuntu
RUN apt-get update -y
RUN apt-get install apache2 -y
RUN apt-get install git -y
ADD . /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
VOLUME ["/iccpinfotech"]
EXPOSE 100
CMD [ "apache2","start" ]
# For Node.js-based frontend/backend apps
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
CMD ["npm", "start"]

