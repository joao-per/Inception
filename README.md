<h1 align="center">
	🐳 Inception 🐳
</h1>

<p align="center">
	<b><i> "Dockerizing Dreams, One Container at a Time!" - Lebron James 🏀 </i></b>
</p>

<div align="center">
    <img alt="Inception" src="https://github.com/joao-per/joao-per/blob/main/Badges/Inception.png" />
</div>

## Overview 🌟

Inception is a robust project designed to create a fully dockerized web environment. Leveraging Docker's power, we set up a stack with Nginx, WordPress, and MariaDB, each in separate containers for optimized performance and scalability. 🐳💻

## Technical Features 🛠️

- **MariaDB Container**: Includes `mariadb-server` for robust data management. A custom script (`maria.sh`) initializes the database. 🗃️
- **Nginx Container**: Installs `nginx` and `openssl` for secure web serving, with SSL certificates generated on-the-fly. Custom Nginx configuration is provided via `nginx.conf`. 🌍🔒
- **WordPress Container**: This container includes PHP and its extensions, alongside `wp-cli` for WordPress management. A specific script (`wp_conf.sh`) configures and launches WordPress. 📝

## Installation and Setup 📈

1. Clone the repository: `git clone <repo-link>`
2. Change localhost to joao-per.42.fr in `/etc/hosts` file
3. Build and launch the containers: `docker-compose up --build`
4. Access the website at: `https://joao-per.42.fr`

## Configuration Files 📝

- **MariaDB**: Configured through `maria.sh`, initializing the database system.
- **Nginx**: `nginx_config.conf` sets up SSL and reverse proxy to WordPress.
- **WordPress**: `wp_conf.sh` downloads, configures, and installs WordPress with predefined environment variables.

## Usage Tips 💡

- Ensure Docker and Docker Compose are installed on your system.
- Modify environment variables in `.env` file for custom configuration.
- Access container logs for debugging: `docker logs <container-name>`
- Access container shell for debugging: `docker exec -it <container-name> /bin/bash`