# frozen_string_literal: true

require 'bindata'
require 'java_serialization/meta_value'

module JavaSerialization
  class PrevObject < BinData::Primitive
    endian :big
    uint32 :handle_id
    meta_value :val

    def get
      self.val.get
    end

    def set(v)
      if v.is_a?(Hash)
        handle_id = v[:handle_id]
        value = MetaValue::new(v[:value])
        self.handle_id = handle_id
        self.val = value
      end
      self
    end
  end
end
