# frozen_string_literal: true

require 'bindata'
require 'java_serialization/java_string'

module JavaSerialization
  class NewString
    def self.of(value, handle_manager:)
      new_string = JavaString::new(value)
      handle_manager.next_handle!(:"string_#{value}", val: new_string)
      new_string
    end
  end
end
