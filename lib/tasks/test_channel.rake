namespace :test do
  desc "This task does nothing"
  task :console => [ :environment ]  do
    kafka = Kafka.new(seed_brokers: "localhost:9092")

    kafka.each_message(topic: "greetings") do |message|
      ActionCable.server.broadcast 'web_notifications_channel', message: message
    end
  end


end
