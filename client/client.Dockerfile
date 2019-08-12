FROM node:8.16.0-alpine
# set working directory
RUN mkdir /app
WORKDIR /app
 
# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
 
# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @vue/cli
COPY . /app
ARG VUE_APP_API_URL
ENV VUE_APP_API_URL $VUE_APP_API_URL
# start app
CMD ["npm", "run", "serve"]