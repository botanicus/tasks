require "yaml"

module Tasks
  class TaskGroup
    getter name, task_group

    def initialize(@name : String, @task_group = Array(Task).new)
    end

    def <<(task : Task) : self
      @task_group << task
      self
    end
  end

  class TaskGroupSerialiser
    def initialize(@task_group : TaskGroup)
    end

    def data : Hash(String | Time, Array)
      {
        @task_group.name => (
          @task_group.task_group.map do |task|
            TaskSerialiser.new(task).data
          end
        ),
      }
    end
  end

  class TaskGroupDeserialiser
    def initialize(@name : String | Time, @data : YAML::Type)
    end

    def deserialise # : TaskGroup
      p [:n, @name]
      p [:d, @data]
      TaskGroup.new(
        @name,
        @data.map do |task_data|
          p ["td", task_data]
          TaskDeserialiser.new(task_data).deserialise
        end
      )
    end
  end
end
