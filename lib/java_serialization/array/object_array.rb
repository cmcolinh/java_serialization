# frozen_string_literal: true

require 'bindata'
require 'java_serialization/object'

module JavaSerialization
  module Array
    class ObjectArray < BinData::Record
      endian :big
      uint32 :length_of_array
      array :data,
        type: :object,
        initial_length: :length_of_array
    end
  end
end

