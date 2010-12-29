#!/usr/bin/env ruby

require 'socket'

s0 = TCPServer.open(20000)

while true
  sock = s0.accept
  p sock.peeraddr

  while buf = sock.gets
    p buf
  end
  sock.close
end

s0.close

