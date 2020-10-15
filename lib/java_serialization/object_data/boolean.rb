# frozen_string_literal: true

require 'bindata'
require 'java_serialization/class_desc_fields'
#require 'java_serialization/class_annotation'

module JavaSerialization
  class ObjectData < BinData::Choice
    class Boolean < BinData::Primitive
      endian :big
      bit7 :unused
      bit1 :val

      def get
        self.val.eql? 1
      end

      def set(v)
        self.val = v
      end
    end
  end
end
