# frozen_string_literal: true

require 'bindata'
require 'java_serialization/java_string'
require 'java_serialization/java_serialized_string'

module JavaSerialization
  class ObjectDesc < BinData::Record
    java_string :field_name
    java_serialized_string :class_name
  end
end
