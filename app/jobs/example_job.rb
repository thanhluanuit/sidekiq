class ExampleJob < ApplicationJob
  queue_as :default

  def perform(index)
    puts "Index: #{index}"
    sleep(0.5)
  end
end
