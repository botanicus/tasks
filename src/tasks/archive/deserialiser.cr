require "yaml"

module Tasks
  module Archive
    class TaskListDeserialiser
    end

    class Task # Doubles as TaskDeserialiser.
      YAML.mapping(title: String, start_time: Time, end_time: Time)
    end
  end
end
