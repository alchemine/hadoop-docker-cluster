#!/bin/bash

# 1. Create network
docker network create hadoop-network

# 2. Create hadoop cluster
docker compose -f docker-compose-hadoop.yml up -d namenode hive-metastore-postgresql
docker compose -f docker-compose-hadoop.yml up -d datanode hive-metastore
docker compose -f docker-compose-hadoop.yml up -d hive-server
docker compose -f docker-compose-hadoop.yml up -d spark-master spark-worker spark-notebook hue

# 3. Create airflow cluster
docker compose -f docker-compose-airflow.yml up airflow-init
docker compose -f docker-compose-airflow.yml up -d

# 4. Create kafka cluster
docker compose -f docker-compose-kafka.yml up -d

# 5. Check
docker ps -a

my_ip=`ip route get 1 | awk '{print $7;exit}'`
echo "[Interfaces]"
echo "Airflow"
echo " - Airflow webserver: http://${my_ip}:8080"
echo " - Airflow worker: ssh://${my_ip}:10022"
echo "Hadoop"
echo " - Namenode: http://${my_ip}:50070"
echo " - Datanode: http://${my_ip}:50075"
echo " - Hue: http://${my_ip}:8088"
echo "Spark"
echo " - Spark master: http://${my_ip}:18080"
echo " - Spark worker: http://${my_ip}:8081"
echo " - Spark notebook: http://${my_ip}:9001"
echo "Kafka"
echo " - Kafdrop: http://${my_ip}:9000"