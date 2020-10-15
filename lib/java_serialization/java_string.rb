# frozen_string_literal: true

require 'bindata'

module JavaSerialization
  class JavaString < BinData::Primitive
    endian :big
    uint16 :len, value: ->{ data&.length || 0 }
    string :data, read_length: :len

    def get
      self.data
    end

    def set(v)
      self.data = v
    end
  end
end
