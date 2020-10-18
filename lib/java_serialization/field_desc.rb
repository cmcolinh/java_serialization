# frozen_string_literal: true

require 'bindata'
require 'java_serialization/primitive_desc'
require 'java_serialization/object_desc'


module JavaSerialization
  class FieldDesc < BinData::Record
    endian :big
    string :typecode, read_length: 1
    choice :desc,
      selection: :typecode,
      choices: {
        'B' => :primitive_desc, #'B' for byte
        'C' => :primitive_desc, #'C' for char
        'D' => :primitive_desc, #'D' for double
        'F' => :primitive_desc, #'F' for float
        'I' => :primitive_desc, #'I' for int
        'J' => :primitive_desc, #'J' for long
        'L' => :object_desc, #'L' for object
        'S' => :primitive_desc, #'S' for short
        'Z' => :primitive_desc, #'Z' for boolean
        '[' => :object_desc #'[' for array
      }

    def self.of(field_as_array:, handle_manager:)
      typecode, field_name, field_class = field_as_array
      if ['B', 'C', 'D', 'F', 'I', 'J', 'S', 'Z'].include?(typecode)
        FieldDesc::new(
          typecode: typecode,
          desc: PrimitiveDesc::new(field_name: field_name))
      elsif ['L', '['].include?(typecode)
        FieldDesc::new(
          typecode: typecode,
          desc: ObjectDesc::of(field_as_array, handle_manager: handle_manager))
      end
    end
  end
end
