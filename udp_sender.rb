#!/usr/bin/env ruby
require 'socket'
sender = UDPSocket.open()

# sockaddr = Socket.pack_sockaddr_in(10000, "127.0.0.1")
sockaddr = Socket.pack_sockaddr_in(10000, "255.255.255.255")
sender.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, 1)
sender.send("HELLO", 0, sockaddr)
sender.close
