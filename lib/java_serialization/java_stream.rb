# frozen_string_literal: true

require 'java_serialization/contents'

module JavaSerialization
  class JavaStream < BinData::Record
    endian :big
    uint16 :magic, asserted_value: 0xaced
    uint32 :version, asserted_value: 0x0005
    contents :contents
  end
end
