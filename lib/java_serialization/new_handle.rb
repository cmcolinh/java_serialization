# frozen_string_literal: true

require 'bindata'

module JavaSerialization
  class NewHandle < BinData::Primitive
    endian :big

    def get
      @data
    end

    def set(v)
      @data = v
    end
  end
end
