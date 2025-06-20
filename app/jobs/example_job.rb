class ExampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Running example job with args: #{args}"
  end
end