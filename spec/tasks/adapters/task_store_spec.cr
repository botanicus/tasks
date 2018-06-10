describe Tasks::TaskStore do
  it "..." do
    task = Tasks::Task.new("Test")
    task_list = Tasks::TaskList.new(Set{task})
    task_list_serialiser = Tasks::TaskListSerialiser.new(task_list)
    Tasks::TaskStore.save("/tmp/tasks.yml", task_list_serialiser)
    Tasks::TaskStore.load("/tmp/tasks.yml")
  end
end
