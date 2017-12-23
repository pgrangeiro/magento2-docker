FROM tutum/nginx

# Setup templates
ARG ENV
ENV ENVIRON=${ENV}

RUN rm -rf /etc/nginx/sites-enabled/default
ADD ./$ENVIRON/magento.conf /etc/nginx/sites-enabled
