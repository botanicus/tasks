describe Tasks::TaskStore do
  it "..." do
    task = Tasks::Task.new("Test")
    task_group = Tasks::TaskGroup.new(Set{task})
    task_group_serialiser = Tasks::TaskGroupSerialiser.new(task_group)
    Tasks::TaskStore.save("/tmp/tasks.yml", task_group_serialiser)
    Tasks::TaskStore.load("/tmp/tasks.yml")
  end
end
