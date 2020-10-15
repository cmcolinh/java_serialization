# frozen_string_literal: true

require 'bindata'
require 'java_serialization/new_string'
require 'java_serialization/null_reference'

module JavaSerialization
  class JavaSerializedString < BinData::Primitive
    endian :big
    uint8 :type_marker
    choice :val,
      selection: :type_marker,
      choices: {0x70 => :null_reference, 0x71 => :prev_object, 0x74 => :new_string}

    def get
      self.val
    end

    def set(v)
      if v.is_a? Hash
        handle_manager = v[:handle_manager]
        value = v[:value]
        if value.nil?
          self.type_marker = 0x70
          self.val = NullReference::new
        elsif handle_manager.has_handle?(:"string_#{value}")
          self.type_marker = 0x71
          self.val = handle_manager.get_object(:"string_#{value}")
        else
          self.type_marker = 0x74
          self.val = NewSerializedString::new.set(handle_manager: handle_manager, value: value)
        end
      end
      self
    end
  end
end
