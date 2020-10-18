# frozen_string_literal: true

require 'java_serialization/object_or_block_data'

module JavaSerialization
  class Contents < BinData::Record
    array :contents, type: :object_or_block_data
  end
end
