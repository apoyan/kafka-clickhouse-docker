require 'kafka'
require 'json'
require 'logger'

logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

kafka = Kafka.new(seed_brokers: "kafka://localhost:9092", logger: logger)
kafka_producer = kafka.async_producer(delivery_interval: 10)

# kafka.create_topic("filters")
# kafka.delete_topic("filters")
# puts kafka.describe_topic("filters")

message = {
	message: 'value1'
}

1.upto(1000) do |i|
	message = {
		timestamp: Time.now.to_i,
		userId: rand(1000),
		name: "field#{i}",
		value: "value#{i}",
		ccPath: "#{i}_controller"
	}
	kafka_producer.produce(message.to_json, topic: "filters")
end

at_exit { kafka_producer.shutdown }
