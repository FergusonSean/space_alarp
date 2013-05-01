require 'resque/tasks'
require 'resque_scheduler/tasks'

namespace :resque do
  task :setup => :environment do
    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'

    # you probably already have this somewhere
    Resque.redis = 'localhost:6379'

    # If you want to be able to dynamically change the schedule,
    # uncomment this line.  A dynamic schedule can be updated via the
    # Resque::Scheduler.set_schedule (and remove_schedule) methods.
    # When dynamic is set to true, the scheduler process looks for
    # schedule changes and applies them on the fly.
    # Note: This feature is only available in >=2.0.0.
    #Resque::Scheduler.dynamic = true

    # The schedule doesn't need to be stored in a YAML, it just needs to
    # be a hash.  YAML is usually the easiest.
    Resque.schedule = YAML.load_file(Rails.root.join('config', 'scheduler.yml'))
  end
  
  task :clear => :environment do
    queues = Resque.queues
    queues.each do |queue_name|
      puts "Clearing #{queue_name}..."
      Resque.redis.del "queue:#{queue_name}"
    end
    
    puts "Clearing delayed..." # in case of scheduler - doesn't break if no scheduler module is installed
    Resque.redis.keys("delayed:*").each do |key|
      Resque.redis.del "#{key}"
    end
    Resque.redis.del "delayed_queue_schedule"
    
    puts "Clearing stats..."
    Resque.redis.set "stat:failed", 0 
    Resque.redis.set "stat:processed", 0
  end
end