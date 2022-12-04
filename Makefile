COMPOSE_FILE = srcs/docker-compose.yml

all : up

up :
	mkdir -p /home/kbaek/data/wp_data /home/kbaek/data/db_data
	sudo cp -rp srcs/requirements/nginx/conf/hosts /etc/hosts
	sudo chmod 777 /etc/hosts
	sudo docker compose -f $(COMPOSE_FILE) up --build

down :
	sudo docker compose -f $(COMPOSE_FILE) down -v

restart	:
	sudo docker compose -f $(COMPOSE_FILE) restart

ps :
	sudo docker compose -f $(COMPOSE_FILE) ps

logs :
	sudo docker compose -f $(COMPOSE_FILE) logs


clean :
	sudo docker compose -f $(COMPOSE_FILE) down --rmi all --volumes --remove-orphans

fclean : clean
	sudo rm -fr -f /home/kbaek/data/wp_data /home/kbaek/data/db_data
	sudo docker network prune --force
	sudo docker volume prune --force
	sudo docker system prune --all --force --volumes

re : fclean all


.PHONY : up down restart ps logs re fclean clean all

