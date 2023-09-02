# Hadoop based Distributed System Docker Cluster
## Installed Components
1. Airflow 2.7.0
2. Hadoop 2.8.0
3. Hive 2.3.2 (scala 2.11.8, python 2.7.9)
4. Spark 2.1.2
5. Kafka 7.0.0-css


## 1. Usage
1. Start an Workbench \
    [run_cluster.sh](https://github.com/alchemine/hadoop-docker-cluster/blob/main/run_cluster.sh)
    ```
    run_cluster.sh
    ```

2. Stop an Workbench \
    [stop_cluster.sh](https://github.com/alchemine/hadoop-docker-cluster/blob/main/stop_cluster.sh)
    ```
    stop_cluster.sh
    ```


## 2. Interfaces (port forwarding)
1. Airflow
    - Webserver: http://localhost:8080
    - Worker: ssh://localhost:10022
2. Hadoop
    - Namenode: http://localhost:50070
    - Datanode: http://localhost:50075
    - Hue: http://localhost:8088
3. Hive
    - Server port: 10000
    - Metastore(postgreSQL) port: 9083
4. Spark
    - Master port: 7077
    - Master webui: http://localhost:18080
    - Worker port: **port forwarding X**
    - Worker webui: http://localhost:8081
    - Worker notebook: http://localhost:9001
5. Kafka
    - Kafka port: 9092
    - Kafdrop: http://localhost:9000
    - `LISTENER_DOCKER_INTERNAL` port: 19092
    - `LISTENER_DOCKER_EXTERNAL` port: 9092


## 3. Airflow connections (example)
1. Hive
    1. hive_cli_conn
        - `Connection Id`: hive_cli_conn
        - `Connection Type`: Hive Client Wrapper 
        - `Host`: localhost (host IP)
        - `Port`: 10000
        - `Extra`: {"use_beeline": true}
2. Spark
    1. spark_conn
        - `Connection Id`: spark_conn
        - `Connection Type`: Spark
        - `Host`: local[*]
3. Kafka
    1. kafka_default
        - `Connection Id`: kafka_default
        - `Connection Type`: Apache Kafka
        - `Config Dict`
          ```
          {
            "bootstrap.servers": "kafka-server:19092",
            "group.id": "group_1",
            "security.protocol": "PLAINTEXT",
            "auto.offset.reset": "beginning"
          }
          ```
    2. kafka_listener
        - `Connection Id`: kafka_listener
        - `Connection Type`: Apache Kafka
        - `Config Dict`
          ```
          {
            "bootstrap.servers": "kafka-server:19092",
            "group.id": "group_2",
            "security.protocol": "PLAINTEXT",
            "auto.offset.reset": "beginning"
          }
          ```


## 4. Notice
- [Important from base repository](https://github.com/big-data-europe/docker-hadoop-spark-workbench#important)


---

## References
- Maintainer of base repository([big-data-europe/docker-hadoop-spark-workbench](https://github.com/big-data-europe/docker-hadoop-spark-workbench)): Ivan Ermilov @earthquakesan \
Note: this repository was a part of BDE H2020 EU project and no longer actively maintained by the project participants. 
- https://github.com/ayyoubmaul/hadoop-docker
- https://medium.com/@ayyoubmaulana/developing-multi-nodes-hadoop-spark-cluster-and-airflow-in-docker-compose-part-1-10331e1e71b3
- https://github.com/mjstealey/hadoop
- https://jybaek.tistory.com/922
- https://1mini2.tistory.com/102
- https://airflow.apache.org/docs/apache-airflow/2.7.0/docker-compose.yaml
