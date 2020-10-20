# frozen_string_literal: true

require 'bindata'
require 'java_serialization/new_object'
require 'java_serialization/new_array'
require 'java_serialization/new_string'
require 'java_serialization/new_class_desc'
require 'java_serialization/prev_object'
require 'java_serialization/null_reference'

module JavaSerialization
  class NewArray < BinData::Record
  end

  class Object < BinData::Record
    TC_NULL = 0x70
    TC_REFERENCE = 0x71
    TC_CLASSDESC = 0x72
    TC_OBJECT = 0x73
    TC_STRING = 0x74
    TC_ARRAY = 0x75

    endian :big
    uint8 :type_marker
    choice :val,
      selection: :type_marker,
      choices: {
        TC_OBJECT => :new_object,
        TC_ARRAY => :new_array,
        TC_STRING => :java_string,
        TC_CLASSDESC => :new_class_desc,
        TC_REFERENCE => :prev_object,
        TC_NULL => :null_reference
      }
  end
end
