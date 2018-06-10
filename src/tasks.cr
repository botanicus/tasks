require "colorize"
require "./tasks/*"
require "./tasks/adapters/*"

case ARGV.first?
when "next"
  task_list_path = ENV.fetch("TASK_LIST_PATH", "tasks.yml")

  unless File.exists?(task_list_path)
    abort "... explain ...".colorize(:red).mode(:bold)
  end

  p task_store = Tasks::TaskStore.load(task_list_path)
  # list = Tasks::TaskList.new

  # list << Tasks::Task.new("First task", Set{:important})
  # list << Tasks::Task.new("Second task")

  # p list
else
  abort "Usage: #{PROGRAM_NAME} [next|start|done]"
end
