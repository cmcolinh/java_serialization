# frozen_string_literal: true

require 'bindata'
require 'java_serialization/object_data/boolean'

module JavaSerialization
  class ObjectData < BinData::Choice
    boolean 'Boolean'
  end
end
