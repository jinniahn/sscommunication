#!/bin/env ruby

PACKET_CMD = 'c'
PACKET_RES = 'r'
PACKET_EVT = 'e'

TYPE_STR = 's'
TYPE_INT = 'i'
TYPE_LST = 'l'
TYPE_DIC = 'd'

class SSConn

  def init
    puts 'init'
  end

  def make_cmd_packet(cmd,params)
    puts "cmd(#{cmd}), param(#{params})"
    packet = Packer.new
    packet.make_cmd(cmd, params)
    puts packet.to_bin
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

class Packer

  @@Sequence = 0;

  def initialize
    @@Sequence += 1 
    @seq = @@Sequence
    @name = nil
    @params = nil
    @packet_type = nil
  end

  def to_bin
    @buffer = []
    @buffer << 'A' << 'J'
    @buffer << @packet_type
    self.pack_string(@name)
    self.pack_data(@params)
    @buffer.join('')
  end

  def make_cmd(cmd, params)
    @packet_type = PACKET_CMD
    @name = cmd
    @params = params
  end

  def pack_data(data)
    data.each do |item|
      if item.is_a? Integer
        self.pack_int item
      elsif item.is_a? Hash
        self.pack_dic item
      elsif item.is_a? Array
        self.pack_list item
      elsif item.is_a? String
        self.pack_string item
      end
    end
  end

  def pack_string(val)
    @buffer << TYPE_STR
    @buffer << [val.size].pack('c')
    @buffer << val
  end

  def pack_int(val)
    @buffer << TYPE_INT
    @buffer << [val].pack('i')
  end

  def pack_list(vals)
    @buffer << TYPE_LST
    @buffer << [vals.size].pack('c')    
    pack_data(vals)
  end

  def pack_dic(vals)
    @buffer << TYPE_DIC
    @buffer << [vals.size].pack('c')
    pack_data(vals)
  end

end

def main
  puts 'start'
  conn = SSConn.new
  conn.init
  conn.make_cmd_packet('cmd1', [[1,2,3]])
  
end

main
