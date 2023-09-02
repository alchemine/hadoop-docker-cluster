#!/bin/bash

# 1. Create hadoop cluster
docker compose -f docker-compose-hadoop.yml down
docker compose -f docker-compose-airflow.yml down
docker compose -f docker-compose-kafka.yml down

# 2. Check
docker ps -a
