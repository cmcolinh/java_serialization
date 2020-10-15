# frozen_string_literal: true

require 'bindata'
require 'java_serialization/blockdatashort'
require 'java_serialization/blockdatalong'

module JavaSerialization
  class BlockData < BinData::Record
    endian :big
    uint8 :type_marker
    choice :val,
      selection: :type_marker,
      choices: {0x77 => :blockdatashort, 0x7a => :blockdatalong}
  end
end
