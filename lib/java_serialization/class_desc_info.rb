# frozen_string_literal: true

require 'bindata'
require 'java_serialization/class_desc_fields'
#require 'java_serialization/class_annotation'

module JavaSerialization
  class ClassDescInfo < BinData::Record
    endian :big
    uint8 :class_desc_flags
    class_desc_fields :class_desc_fields
    #class_annotation :class_annotation
    #class_desc :super_class_desc is added by 'java_serialization/class_desc.rb'
    #can't add it here since the class doesn't exist yet
  end
end
