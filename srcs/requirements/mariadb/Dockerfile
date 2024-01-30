FROM debian:bullseye-slim

RUN apt update
RUN apt install -y mariadb-server

COPY ./config/maria.sh /home

RUN ls -la /home

RUN chmod +x /home/maria.sh

# Initialize the database
RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT ["/home/maria.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
