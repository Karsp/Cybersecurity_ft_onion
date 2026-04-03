NAME = onion_service

all:
	@mkdir -p ~/data/tor_metadata
	@docker-compose -f srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f srcs/docker-compose.yml down

re: clean all

clean:
	@docker-compose -f srcs/docker-compose.yml down --rmi all -v
	@rm -rf ~/data/tor_metadata

fclean:
	@echo "Removing containers, networks, and the tor_metadata volume..."
	@docker-compose -f srcs/docker-compose.yml down -v
	@# Optional: ensure any dangling volumes or images are pruned
	@docker system prune -f

prune:
	@echo "Cleaning Docker system..."
	docker system prune -af --volumes

.PHONY: all down re clean prune fclean