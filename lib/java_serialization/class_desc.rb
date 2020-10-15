# frozen_string_literal: true

require 'bindata'
require 'java_serialization/null_reference'
require 'java_serialization/prev_object'
require 'java_serialization/new_class_desc'

module JavaSerialization
  class ClassDesc < BinData::Record
    endian :big
    uint8 :type_marker
    choice :val,
      selection: :type_marker,
      choices: {0x70 => :null_reference, 0x71 => :prev_object, 0x72 => :new_class_desc}
  end
end

JavaSerialization::ClassDescInfo.class_desc :super_class_desc