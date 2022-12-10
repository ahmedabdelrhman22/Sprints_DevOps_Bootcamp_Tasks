FROM httpd:latest
COPY ./htmlfile.html /usr/local/apache2/htdocs/
copy ./httpd.conf /usr/local/apache2/conf/httpd.conf
ENV CONTAINER docker
EXPOSE 9999
CMD echo $CONTAINER
