# frozen_string_literal: true

require 'bindata'
require 'java_serialization/class_desc'
require 'java_serialization/handle_manager'
require 'java_serialization/new_handle'
require 'java_serialization/object_data'

module JavaSerialization
  class NewObject < BinData::Record
    endian :big
    class_desc :class_desc
    handle_manager :handle_manager
    new_handle :new_handle, initial_value: ->{
      NewHandle::new(handle_manager.next_handle!(:"object_#{object_data.handle_key}", self))}
    object_data :object_data, selection: ->{class_desc.val.class_name.to_s.gsub(/^.*\./, "")}
  end
end
