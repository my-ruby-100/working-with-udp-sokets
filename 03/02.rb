require 'socket'

# server = Socket.new(:INET, :DGRAM)
# addr = Socket.pack_sockaddr_in(9911, '0.0.0.0')
# server.bind(addr)
server = UDPSocket.new
server.bind("0.0.0.0", 9911)

puts "UDP 服务器已启动，等待客户端消息..."

loop do
  message = server.recvfrom(1024)
  # ["\x00\x00\x00D{ \"COMMAND\" : \"DevStatus\", \"PARAM\" : { \"sn\" : \"8175523040000651\" } }", ["AF_INET", 45454, "192.168.100.4", "192.168.100.4"]]
  puts message.inspect
end