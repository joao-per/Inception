FROM debian:bullseye-slim

RUN apt update \
   && apt install -y mariadb-server

COPY ./config/maria.sh /home

RUN chmod +x /home/maria.sh

RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT ["/home/maria.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
