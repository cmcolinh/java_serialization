# frozen_string_literal: true

require 'bindata'

module JavaSerialization
  class BlockDataLong < BinData::Record
    endian :big
    uint32 :block_length
    string :block_data, length: :block_length
  end
end
