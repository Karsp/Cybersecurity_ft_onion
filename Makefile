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

.PHONY: all down re clean