require "yaml"

module Tasks
  class TaskList
    getter task_list

    def initialize(@task_list = Array(TaskGroup).new)
    end

    def <<(task : TaskGroup) : self
      @task_list << task
      self
    end
  end

  class TaskListSerialiser
    def initialize(@task_list : TaskList)
    end

    def data : Hash
      hash = Hash(String | Date, TaskGroup).new
      @task_list.task_list.reduce(hash) do |buffer, task_group|
        buffer.merge(
          {task_group.name => TaskGroupSerialiser.new(task_group).data}
        )
      end
    end
  end

  class TaskListDeserialiser
    def initialize(@data : YAML::Any)
    end

    def deserialise #: TaskList
      # block = -> (task_group_name : String | Time, task_group_data : Hash(YAML::Any, YAML::Any)) do
      #   p task_group_name
      #   p task_group_data
      #   TaskGroupDeserialiser.new(task_group_name, task_group_data).deserialise
      # end

      # TaskList.new(@data.map(&block))
      # TaskList.new(
      #   *Tuple.new(
          @data.as_h.map do |task_group_name, task_group_tasks|
            if task_group_name.is_a?(String) || task_group_name.is_a?(Time) # Why do I need this?
              p [:tg, task_group_name, task_group_name.to_s.class]
              p [:tg, task_group_tasks, task_group_tasks.class]
              TaskGroupDeserialiser.new(task_group_name, task_group_tasks.dup).deserialise
            end
          end
        # )
      # )
    end
  end
end
