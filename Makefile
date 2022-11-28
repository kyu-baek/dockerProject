NAME = inception
COMPOSE_FILE = srcs/docker-compose.yml

$(NAME) :
	sudo docker-compose -f $(COMPOSE_FILE) up --force-recreate --build -d

all : $(NAME)

up :
	mkdir -p srcs/docker-dbdata && mkdir -p srcs/docker-wordpress
	sudo docker-compose -f $(COMPOSE_FILE) up --build
	sudo cp -rp srcs/nginx/conf/hosts /etc/hosts
	sudo chmod 777 /etc/hosts

down :
	sudo docker-compose -f $(COMPOSE_FILE) down

restart	:
	sudo docker-compose -f $(COMPOSE_FILE) restart

ps :
	sudo docker-compose -f $(COMPOSE_FILE) ps

logs :
	sudo docker-compose -f $(COMPOSE_FILE) logs


clean :
	sudo docker-compose -f $(COMPOSE_FILE) down --rmi all --volumes --remove-orphans

fclean : clean
	sudo rm -rf srcs/docker-dbdata srcs/docker-wordpress
	sudo docker network prune --force
	sudo docker volume prune --force
	sudo docker system prune --all --force --volumes

re : fclean all

# @$(MAKE) fclean
# @$(MAKE) all

.PHONY : up down restart ps log exec re fclean clean all