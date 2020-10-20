# frozen_string_literal: true

require 'bindata'

module JavaSerialization
  class NullReference < BinData::Primitive
    def get
      "TC_NULL"
    end

    def set(v)
    end
  end
end
