# frozen_string_literal: true

require 'java_serialization/prev_object'

module JavaSerialization
  class HandleManager < BinData::Primitive
    endian :big

    def init
      @next_handle ||= 0x007e0000
      @prev_objects_by_key ||= {}
      @objects_by_handle ||= {}
    end

    def has_handle?(key)
      init
      @prev_objects_by_key.has_key?(key)
    end

    def get_object(key)
      init
      @prev_objects_by_key[key]
    end

    def next_handle!(key, val:)
      init
      prev_object = PrevObject::of(handle_id: @next_handle, value: val)
      @prev_objects_by_key[key] = prev_object
      @objects_by_handle[@next_handle] = val
      @next_handle += 1
      prev_object
    end

    def get
      "JavaSerialization::HandleManager"
    end

    def set(v)
    end
  end
end
