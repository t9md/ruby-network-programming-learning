#!/usr/bin/env ruby
require 'socket'
receiver = UDPSocket.open()
receiver.bind("0.0.0.0", 10000)
p receiver.recv(65535)
receiver.close
