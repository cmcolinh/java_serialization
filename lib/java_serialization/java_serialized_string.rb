# frozen_string_literal: true

require 'bindata'
require 'java_serialization/new_string'
require 'java_serialization/null_reference'

module JavaSerialization
  class JavaSerializedString < BinData::Record
    endian :big
    uint8 :type_marker
    choice :val,
      selection: :type_marker,
      choices: {0x70 => :null_reference, 0x71 => :prev_object, 0x74 => :new_string}

    def self.of(handle_manager:, value:)
      if value.nil?
        JavaSerializedString::new(type_marker: 0x70, val: NullReference::new)
      elsif handle_manager.has_handle?(:"string_#{value}")
        JavaSerializedString::new(type_marker: 0x71, val: handle_manager.get_object(:"string_#{value}"))
      else
        JavaSerializedString::new(
          type_marker: 0x74,
          val: NewString::of(handle_manager: handle_manager, value: value))
      end
    end
  end
end
