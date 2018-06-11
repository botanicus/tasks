require "./archive/*"

module Tasks
  module Archive
    def self.load(path : String) : Task
      deserialiser = TaskListDeserialiser.new(File.read(path))
      deserialiser.deserialise
    end

    def self.save(path : String, serialiser : TaskListSerialiser) : Nil
      serialised_data = YAML.dump(serialiser.data)
      File.open(path, "w") do |file|
        file.puts(serialised_data)
      end
    end
  end
end
