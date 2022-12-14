FROM node:alpine
ARG APP_VERSION=latest
RUN install npm && cd /node/weather-app && /var/weather-app
COPY /node/weather-app /var/weather-app
COPY . .
ENV NODE_ENV production
WORKDIR /node/weather-app
WORKDIR /var/weather-app
ADD https://github.com/sabreensalama/Good_Reads_App
EXPOSE 3000
ENTRYPOINT [/bin/www]

