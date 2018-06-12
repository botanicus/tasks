require "colorize"
require "./tasks/*"
require "./tasks/adapters/*"

TASK_GROUP_PATH = ENV.fetch("TASK_LIST_PATH", "tasks.yml")

unless File.exists?(TASK_GROUP_PATH)
  abort "... explain ...".colorize(:red).mode(:bold)
end

task_list = Tasks::TaskStore.load(TASK_GROUP_PATH)

case ARGV.first?
when "next"
  puts "Coming next: ".colorize(:cyan).mode(:bold)
  puts "  #{task_list.today.first}"
when "start"
  p :start
when "done"
  TASK_ARCHIVE_PATH = ENV.fetch("TASK_ARCHIVE_PATH", "task-archive.yml")

  unless File.exists?(TASK_ARCHIVE_PATH)
    abort "... explain ...".colorize(:red).mode(:bold)
  end

  finished_task = task_list.shift
  task_archive = Tasks::Archive.new(TASK_ARCHIVE_PATH)
  task_archive << finished_task
  task_archive.save

  Tasks::TaskStore.save(TASK_GROUP_PATH, task_list)
  # TODO: Reset the _timestamp.

  puts "#{"[x] ".colorize(:green).mode(:bold)} #{finished_task}"
else
  abort "Usage: #{PROGRAM_NAME} [next|start|done]"
end
