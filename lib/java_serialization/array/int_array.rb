# frozen_string_literal: true

require 'bindata'

module JavaSerialization
  module Array
    class IntArray < BinData::Record
      endian :big
      uint32 :length_of_array
      array :data,
        type: :uint32,
        initial_length: :length_of_array
    end
  end
end

