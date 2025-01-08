class HardJob
  include Sidekiq::Job

  sidekiq_options queue: 'default'

  def perform(*args)
    Rails.logger.info("HardJob is running")
    Rails.logger.info("Redis: #{Sidekiq.redis {|conn| conn }.instance_variable_get(:@client).inspect}")
    Rails.logger.info("Queue: #{self.class.sidekiq_options['queue']}")
    Rails.logger.info("Queue Paused? #{Sidekiq::Queue.new(self.class.sidekiq_options['queue']).paused?}")
  end
end
