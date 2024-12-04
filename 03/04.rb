require 'socket'

# 1. udp_server_loop(port) 在指定的端口上创建一个 UDP 服务器，并在循环中持续接收和处理来自客户端的消息。

Socket.udp_server_loop(9911) do |msg, msg_src|
  puts "收到消息: #{msg} 来自 #{msg_src.ip_address}:#{msg_src.ip_port}"
  msg_src.reply("Echo: #{msg}")  # 向客户端发送回复
end

# 2. udp_server_loop_on(sockets) 接收一个或多个已绑定的 UDP socket，并在这些套接字上监听消息。

socket1 = UDPSocket.new
socket1.bind('0.0.0.0', 9911)

socket2 = UDPSocket.new
socket2.bind('0.0.0.0', 9912)

Socket.udp_server_loop_on([socket1, socket2]) do |msg, msg_src|
  puts "收到消息: #{msg} 来自 #{msg_src.ip_address}:#{msg_src.ip_port}"
  msg_src.reply("Echo from #{msg_src.ip_port}: #{msg}")
end

# 3. udp_server_recv(sockets) 从一个或多个 UDP socket 中接收一条消息。与 recvfrom 类似，但返回的格式更适合 Ruby 的块结构。

require 'socket'

socket = UDPSocket.new
socket.bind('0.0.0.0', 9911)

Socket.udp_server_recv([socket]) do |msg, msg_src|
  puts "收到消息: #{msg} 来自 #{msg_src.ip_address}:#{msg_src.ip_port}"
  msg_src.reply("Hello #{msg_src.ip_address}")
end

# 4. udp_server_sockets(port, host = nil) 创建并返回一个或多个绑定到指定端口的 UDP socket，供其他方法（如 udp_server_loop_on）使用。

# 创建并绑定多个 socket（IPv4 和 IPv6）
sockets = Socket.udp_server_sockets(9911)

Socket.udp_server_loop_on(sockets) do |msg, msg_src|
  puts "收到消息: #{msg} 来自 #{msg_src.ip_address}:#{msg_src.ip_port}"
  msg_src.reply("Hello from multiple sockets!")
end