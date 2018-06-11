require "yaml"

module Tasks
  RAW_PKG_DATA = 
  #PACKAGE = NamedTuple(String, String | Array(String)).new(YAML.parse(RAW_PKG_DATA))
  #VERSION = PACKAGE[:version]
  PACKAGE = YAML.parse({% begin %}"{{system("cat shard.yml")}}"{% end %})
  VERSION = PACKAGE["version"]
end
