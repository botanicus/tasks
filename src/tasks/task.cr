require "yaml"

module Tasks
  class Task
    STATUSES = {:new, :started, :done}

    getter tags
    property title, status

    def initialize(@title : String, @tags = Set(Symbol).new, @status = :new)
      unless STATUSES.includes?(@status)
        raise ArgumentError.new("Must be one of #{STATUSES.inspect}")
      end
    end

    def data : NamedTuple
      {% begin %}
        {
          {% for variable in @type.instance_vars %}
            {{variable.name.stringify}}: @{{variable}},
          {% end %}
        }
      {% end %}
    end
  end

  class TaskStatusWrapper
    def initialize(@task : Task)
    end

    {% for status in Task::STATUSES %}
      def {{status.id}}? : Bool
        @task.status == {{status}}
      end

      def {{status.id}}! : Symbol
        @task.status = {{status}}
      end
    {% end %}
  end

  class TaskSerialiser
    def initialize(@task : Task)
    end

    def data : Hash
      hash = Hash(Symbol, Symbol | String | Set(Symbol)).new
      @task.data.to_h.reduce(hash) do |buffer, (key, value)|
        unless value.responds_to?(:empty?) && value.empty?
          buffer.merge!({key => value})
        end

        buffer
      end

      # TODO: 10/06/2018 I'm getting can only instantiate NamedTuple with named arguments.
      # NamedTuple(Symbol, Symbol | String | Set(Symbol)).from(i)
    end
  end

  class TaskDeserialiser
    # YAML.mapping(
    #   title: String,
    #   status: Symbol
    # )

    def initialize(@data : YAML::Type)
    end

    def deserialise # : Task
      p @data
      # p arguments = @data.as_h
      # p arguments = NamedTuple(String, Symbol | String).from(@data.as_h)
      Task.new("test") # (**arguments)
    end
  end
end
