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

    def self.of(class_desc_flags:, fields_as_array:, handle_manager:,
        super_class_desc: ClassDesc::new(type_marker: 0x70, val: NullReference::new))
      ClassDescInfo::new(
        class_desc_flags: class_desc_flags,
        class_desc_fields: ClassDescFields::new(field_desc: fields_as_array.map{|field_as_array|
          FieldDesc::of(field_as_array: field_as_array, handle_manager: handle_manager)},
        super_class_desc: super_class_desc))
    end
  end
end
