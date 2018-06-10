require "yaml"

module Tasks
  class TaskList
    getter task_list

    def initialize(@task_list = Set(Task).new)
    end

    def <<(task : Task) : self
      @task_list << task
      self
    end
  end

  class TaskListSerialiser
    def initialize(@task_list : TaskList)
    end

    def data : Array
      @task_list.task_list.map do |task|
        TaskSerialiser.new(task).data
      end
    end
  end

  class TaskListDeserialiser
    def initialize(@data : YAML::Any)
    end

    def deserialise : TaskList
      TaskList.new(
        Set.new(
          @data.map do |task_data|
            TaskDeserialiser.new(task_data).deserialise
          end
        )
      )
    end
  end
end
