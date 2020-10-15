# frozen_string_literal: true

require 'bindata'

module JavaSerialization
  class BlockDataShort < BinData::Record
    endian :big
    uint8 :block_length
    string :block_data, length: :block_length
  end
end
