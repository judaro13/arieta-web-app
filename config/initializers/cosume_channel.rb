puts "*"*30

def consume_main_channel
  puts "starting consumer"
  kafka = Kafka.new(seed_brokers: "localhost:9092")
  kafka.each_message(topic: "arieta") do |message|
    ActionCable.server.broadcast 'web_notifications_channel', message: message
  end
end

Thread.start { consume_main_channel }
