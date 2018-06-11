require "colorize"
require "./tasks/*"
require "./tasks/adapters/*"

case ARGV.first?
when "next"
  task_group_path = ENV.fetch("TASK_LIST_PATH", "tasks.yml")

  unless File.exists?(task_group_path)
    abort "... explain ...".colorize(:red).mode(:bold)
  end

  p task_store = Tasks::TaskStore.load(task_group_path)
  # list = Tasks::TaskGroup.new

  # list << Tasks::Task.new("First task", Set{:important})
  # list << Tasks::Task.new("Second task")

  # p list
when "start"
  p :start
when "done"
  p :done
else
  abort "Usage: #{PROGRAM_NAME} [next|start|done]"
end
