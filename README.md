## How to use HDFS/Spark Workbench
1. Start an HDFS/Spark Workbench
```
run_cluster.sh
```

2. Stop an HDFS/Spark Workbench
```
stop_cluster.sh
```


## Interfaces
* Namenode: http://localhost:50070
* Datanode: http://localhost:50075
* Spark-master: http://localhost:18080
* Spark-notebook: http://localhost:9001
* Hue (HDFS browser): http://localhost:8088/home
* Airflow webserver: http://localhost:8080
* Airflow worker: ssh://localhost:10022


## Important
When opening Hue, you might encounter ```NoReverseMatch: u'about' is not a registered namespace``` error after login. \
I disabled 'about' page (which is default one), because it caused docker container to hang. \
To access Hue when you have such an error, you need to append /home to your URI: ```http://docker-host-ip:8088/home```


## Docs
* [Motivation behind the repo and an example usage @BDE2020 Blog](http://www.big-data-europe.eu/scalable-sparkhdfs-workbench-using-docker/)


## Count Example for Spark Notebooks
```
val spark = SparkSession
  .builder()
  .appName("Simple Count Example")
  .getOrCreate()

val tf = spark.read.textFile("/data.csv")
tf.count()
```


## References
- Maintainer of base repository([big-data-europe/docker-hadoop-spark-workbench](https://github.com/big-data-europe/docker-hadoop-spark-workbench)): Ivan Ermilov @earthquakesan \
Note: this repository was a part of BDE H2020 EU project and no longer actively maintained by the project participants. 
- https://github.com/ayyoubmaul/hadoop-docker
- https://medium.com/@ayyoubmaulana/developing-multi-nodes-hadoop-spark-cluster-and-airflow-in-docker-compose-part-1-10331e1e71b3
- https://github.com/mjstealey/hadoop
- https://jybaek.tistory.com/922
- https://1mini2.tistory.com/102
- https://airflow.apache.org/docs/apache-airflow/2.7.0/docker-compose.yaml