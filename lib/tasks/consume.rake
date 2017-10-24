namespace :consume do
  desc "This task does nothing"
  task :main_channel => [ :environment ]  do
    kafka = Kafka.new(seed_brokers: "localhost:9092")
    kafka.each_message(topic: "arieta") do |message|
      ActionCable.server.broadcast 'web_notifications_channel', message: message
    end
  end


end
