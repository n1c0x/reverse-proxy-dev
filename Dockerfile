FROM nginx

# Timezone configuration
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Service start
CMD service nginx start && tail -F /var/log/nginx/error.log