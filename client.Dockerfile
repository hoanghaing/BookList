FROM node:8.16.0-alpine
WORKDIR /client
# RUN npm install -g @vue/cli@3.7.0
# RUN npm install axios@0.18.0 --save
# RUN npm install bootstrap@4.3.1 --save
# RUN npm install bootstrap-vue@2.0.0-rc.19 --save
RUN npm install
RUN mkdir /app
WORKDIR /app

# RUN npm run serve