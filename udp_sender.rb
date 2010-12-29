#!/usr/bin/env ruby
require 'socket'

def main(mode)
  sender = UDPSocket.open()

  case mode.intern
  when :default
    sockaddr = Socket.pack_sockaddr_in(10000, "127.0.0.1")
  when :broadcast
    sockaddr = Socket.pack_sockaddr_in(10000, "255.255.255.255")
    sender.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, 1)
  when :multicast
    # [FIXME] couldn't send multicast why!!
    require 'ipaddr'
    sockaddr = Socket.pack_sockaddr_in(10000, "239.192.1.2")
    mif = IPAddr.new("127.0.0.1").hton

    # sender.setsockopt(Socket::IPPROTO_IP,
                   # Socket::IP_MULTICAST_TTL, [3].pack("i"))

    sender.setsockopt(Socket::IPPROTO_IP, Socket::IP_MULTICAST_IF, mif)

  end
  sender.send("HELLO", 0, sockaddr)
  sender.close
end

supported_mode = %w(
  default
  broadcast
  multicast
)

mode = ARGV[0].to_s.chomp
if supported_mode.include? mode
  main(mode)
else
  puts
  puts "#$0 '#{supported_mode.join('|')}'"
  puts
end

