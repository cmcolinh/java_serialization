# frozen_string_literal: true

require 'java_serialization/object_or_blockdata'

module JavaSerialization
  class Contents < BinData::Record
    array :contents, type: :object_or_blockdata
  end
end
