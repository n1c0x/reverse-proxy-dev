FROM nginx
# STOPSIGNAL SIGQUIT
STOPSIGNAL 3

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# RUN apt update && apt install -y apt-transport-https \
# 	procps \
# 	gnupg \
# 	curl 

# RUN curl -sL https://repos.influxdata.com/influxdb.key | apt-key add -
# RUN echo "deb https://repos.influxdata.com/debian buster stable" > /etc/apt/sources.list.d/influxdb.list
# RUN apt update && apt install -y telegraf
# COPY ./telegraf/telegraf-client.conf /etc/telegraf/telegraf.conf
# COPY wrapper.sh wrapper.sh
# CMD ./wrapper.sh
# CMD service telegraf start && service nginx start && tail -F /var/log/nginx/error.log
CMD service nginx start && tail -F /var/log/nginx/error.log