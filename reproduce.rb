# typed: false

queue = Sidekiq::Queue.new('default')

puts "#### VERSIONS ####"
puts "Sidekiq: #{Sidekiq::VERSION}"
puts "Sidekiq Pro: #{Sidekiq::Pro::VERSION}"
puts "Sidekiq Ent: #{Sidekiq::Enterprise::VERSION}"
puts

puts "#### Client-side Redis ####"
redis_client = Sidekiq.redis { |redis| redis }
puts


puts '#### Initial queue statuses ####'
puts DateTime.now.iso8601

queue.clear
queue.unpause!
puts "#{queue.name}: #{queue.paused? ? 'paused' : 'unpaused'}"
puts

# only start worker after it has been unpaused
puts 'Now run bin/sidekiq ... press enter once it\'s running'
gets

puts DateTime.now.iso8601
# queue a job once to see it running
puts "Queueing job: #{HardJob.perform_async}"
puts "Expectation: job will run immediately"
puts
# give it a chance to run

puts 'Press enter once to pause queues'
gets

queue.pause!
puts "#{queue.name}: #{queue.paused? ? 'paused' : 'unpaused'}"
puts
# give it a chance to take effect before queuing a job

puts 'Press enter once to queue a job'
gets

# queue a job to see it not running
puts "Queueing job: #{HardJob.perform_async}"
puts "Expecation: job should not run because it is paused"
