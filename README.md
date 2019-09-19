# KafkaElasticsearchToGo
A docker-compose of zookeeper, kafka, elasticsearch and a kafka-es-connector


## Installation
Clone the repository
```bash
git clone https://github.com/Exchizz/KafkaElasticsearchToGo.git
```

Add "127.0.0.1 kafka" to /etc/hosts, so kafka can connect from your host to the kafka container
```bash
echo "127.0.0.1 kafka" | sudo tee -a /etc/hosts
```

## Usage
Run the services in detached mode:
```bash
docker-compose up -d
```

When all containers are running, configure the connector. Go the the config folder and run:
```bash
bash push_configs.sh
```

After a few seconds the container will put messages from kafka topics into elasticsearch


### To add a topic
```bash
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic my_test
```
(The syntax might be a bit different on your host)

### Add data to the kafka topic
```bash
echo '{"username":"hello","id":"a"}' | kafkacat -P -b localhost -t my_test
```

After data has been added to a topic, you should see the topic as an index in kibana.

### Access kibana
Kibana webui can be located at:
```
http://localhost:5601
```



# Troubleshooting
1. If you can't find the index in kibana, try restarting the connector-container. Either stop all containers and start then again, or just restart the connector-container.
