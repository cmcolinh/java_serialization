# frozen_string_literal: true

require 'bindata'
require 'java_serialization/java_string'

module JavaSerialization
  class PrimitiveDesc < BinData::Record
    java_string :field_name
  end
end
