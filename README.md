# kafka-clickhouse-docker

- kafka version `2.11-1.0.2`
- ruby-kafka `0.7.3`

```
git clone
cd kafka-clickhouse-docker
mkdir shared
```

modify the KAFKA_ADVERTISED_HOST_NAME in docker-compose.yml to match your docker host IP (Note: Do not use localhost or 127.0.0.1 as the host ip if you want to run multiple brokers.)

```
docker-compose up
```
