# frozen_string_literal: true

require 'bindata'
require 'java_serialization/field_desc'

module JavaSerialization
  class ClassDescFields < BinData::Record
    endian :big
    uint16 :number_of_fields, value: ->{ field_desc.length }
    array :field_desc, type: :field_desc, initial_length: :number_of_fields
  end
end
