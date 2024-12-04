require 'socket'

# UDP 是无连接的协议，不需要建立连接，数据可以直接发送和接收，因此 不需要调用 listen()
# 创建 socket / 绑定地址和端口 / 直接发送/接收数据
server = Socket.new(:INET, :DGRAM)
addr = Socket.pack_sockaddr_in(9911, '0.0.0.0')
server.bind(addr)

puts "UDP 服务器已启动，等待客户端消息..."

# 这行代码会阻塞并等待客户端的消息，1024 是接收的最大字节
message = server.recvfrom(1024)

# ["\x00\x00\x00D{ \"COMMAND\" : \"DevStatus\", \"PARAM\" : { \"sn\" : \"8175523040000651\" } }", #<Addrinfo: 192.168.100.4:45454 UDP>]
puts message.inspect

# # 返回值是一个数组，message[0] 是消息内容，message[1] 是发送者的信息
# puts message[0].inspect
# puts message[1].inspect
# puts "-----------------"