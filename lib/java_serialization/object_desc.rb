# frozen_string_literal: true

require 'bindata'
require 'java_serialization/java_string'
require 'java_serialization/java_serialized_string'
require 'java_serialization/new_string'

module JavaSerialization
  class ObjectDesc < BinData::Record
    java_string :field_name
    java_serialized_string :class_name

    def self.of(field_as_array, handle_manager:)
      typecode, field_name, field_class = field_as_array
      class_name = JavaSerializedString::of(
        handle_manager: handle_manager,
        value: field_class)
      ObjectDesc::new(field_name: field_name, class_name: class_name)
    end
  end
end
