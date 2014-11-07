module SScon

  TYPE_STR = 's'
  TYPE_INT = 'i'
  TYPE_LST = 'l'
  TYPE_DIC = 'd'

  class SSConn

    def init
    end

    def send_cmd
    end

    def recv
    end

    def recv_cmd
    end

    def recv_evt
    end

    def recv_res
    end

  end

  # class self.Unpacker
  #   def initialize(packet)
  #     @buffer = []
  #   end
    
  #   def unpack_string(val)
  #   end

  #   def unpack_int(val)
  #   end

  #   def unpack_float(val)
  #   end

  #   def unpack_list(vals)
  #   end

  #   def unpack_dic(vals)
  #   end
  # end

  # class self.Packer

  #   def initialize
  #     @buffer = []
  #   end

  #   def to_bin
  #   end
    
  #   def pack_string(val)
  #   end

  #   def pack_int(val)
  #   end

  #   def pack_float(val)
  #   end

  #   def pack_list(vals)
  #   end

  #   def pack_dic(vals)
  #   end
    
  # end
  
end
