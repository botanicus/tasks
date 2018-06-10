require "./tasks/*"

# TODO: Write documentation for `Tasks`

p ARGV
case ARGV.first
when "test"
  list = Tasks::TaskList.new

  list << Tasks::Task.new("First task", Set{:important})
  list << Tasks::Task.new("Second task")

  p list
end
