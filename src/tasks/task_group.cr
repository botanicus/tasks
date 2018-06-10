require "yaml"

module Tasks
  class TaskGroup
    getter task_group

    def initialize(@task_group = Set(Task).new)
    end

    def <<(task : Task) : self
      @task_group << task
      self
    end
  end

  class TaskGroupSerialiser
    def initialize(@task_group : TaskGroup)
    end

    def data : Array
      @task_group.task_group.map do |task|
        TaskSerialiser.new(task).data
      end
    end
  end

  class TaskGroupDeserialiser
    def initialize(@data : YAML::Any)
    end

    def deserialise : TaskGroup
      TaskGroup.new(
        Set.new(
          @data.map do |task_data|
            TaskDeserialiser.new(task_data).deserialise
          end
        )
      )
    end
  end
end
