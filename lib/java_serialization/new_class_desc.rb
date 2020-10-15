# frozen_string_literal: true

require 'bindata'
require 'java_serialization/class_desc_info'
require 'java_serialization/handle_manager'
require 'java_serialization/java_string'
require 'java_serialization/meta_value'
require 'java_serialization/new_handle'

module JavaSerialization
  class NewClassDesc < BinData::Record
    endian :big
    java_string :class_name
    uint64 :serial_version_uid
    handle_manager :handle_manager
    new_handle :new_handle, initial_value: ->{
      NewHandle::new(handle_manager.next_handle!(:"class_description_#{class_name}", self))}
    class_desc_info :class_desc_info
  end
end
