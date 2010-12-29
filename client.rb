#!/usr/bin/env ruby

require 'socket'

begin
  sock = TCPSocket.open("127.0.0.1", 20000)
rescue
  puts "TCPSocket.open filed: #$!\n"
  exit 1
end

sock.write('HELLO')
sock.close
