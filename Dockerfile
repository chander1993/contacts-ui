FROM node:8.5.0 as source
WORKDIR /src/contacts-ui
COPY . /src/contacts-ui
RUN yarn install --production \
    && yarn build

FROM nginx:1.13.5
WORKDIR /opt/contacts-ui
COPY --from=source /src/contacts-ui/build .
COPY default.conf /etc/nginx/conf.d/default.conf
CMD nginx -g 'daemon off;'
