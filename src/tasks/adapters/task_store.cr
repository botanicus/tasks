require "yaml"

module Tasks
  class TaskStore
    def self.load(path : String) #: TaskList
      # data = YAML.parse(File.read(path))
      # TaskListDeserialiser.new(data).deserialise
      # TaskListDeserialiser.from_yaml(File.read(path))
    end

    def self.save(path : String, serialiser : TaskListSerialiser) : Nil
      serialised_data = YAML.dump(serialiser.data)
      File.open(path, "w") do |file|
        file.puts(serialised_data)
      end
    end
  end
end
