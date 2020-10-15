# frozen_string_literal: true

require 'bindata'
require 'java_serialization/java_string'

module JavaSerialization
  class NewString < BinData::Primitive
    endian :big
    java_string :val

    def get
      self.val
    end

    def set(v)
      if v.is_a? Hash
        handle_manager = v[:handle_manager]
        self.val = JavaString::new(v[:value])
        handle_manager.next_handle!(:"string_#{v[value]}", self.val)
      else
        self.val = v
      end
      self
    end
  end
end
