# frozen_string_literal: true

require 'bindata'
require 'java_serialization/meta_value'

module JavaSerialization
  class PrevObject < BinData::Record
    endian :big
    uint32 :handle_id
    meta_value :val

    def get
      val.get
    end

    def to_s
      val.get.to_s
    end

    def self.of(handle_id:, value:)
      val = MetaValue::new(value)
      PrevObject::new(handle_id: handle_id, val: val)
    end
  end
end
