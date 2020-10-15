# frozen_string_literal: true

require 'bindata'
require 'java_serialization/class_desc'
require 'java_serialization/meta_value'
require 'java_serialization/new_handle'
require 'java_serialization/handle_manager'
require 'java_serialization/array/int_array'
require 'java_serialization/array/object_array'

module JavaSerialization
  class NewArray < BinData::Record
    endian :big
    class_desc :class_desc
    handle_manager :handle_manager
    meta_value :handle_key
    new_handle :new_handle, initial_value: ->{
      NewHandle::new(handle_manager.next_handle!(:"object_#{handle_key}", self))}
    choice :array_data,
      selection: ->{class_desc.val.class_name.to_s.gsub(/^.*\./, "")},
      choices: {
        '[I' => :int_array,
        default: :object_array}
  end
end
