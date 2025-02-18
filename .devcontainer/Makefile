.PHONY: up
up: 
	@docker compose up -d

.PHONY: down
down:
	@docker compose down
	
.PHONY: clean
clean:
	@docker system prune

.PHONY: run 
run:
	@docker exec -it rosdev bash