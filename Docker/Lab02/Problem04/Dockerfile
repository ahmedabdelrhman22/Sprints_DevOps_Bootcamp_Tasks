ROM node:alpine
ARG APP_VERSION=latest
RUN install npm && cd /node/weather-app && /var/weather-app
COPY /node/weather-app /var/weather-app
WORKDIR /node/weather-app
ADD https://github.com/sabreensalama/Good_Reads_App
EXPOSE 3000
WORKDIRE /node/weather-app
ENTRYPOINT [/bin/www]
