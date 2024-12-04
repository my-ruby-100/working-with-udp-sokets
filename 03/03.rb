require 'socket'
# 创建一个 UDP 服务器，并在循环中等待数据。

Socket.udp_server_loop(9911) {|msg, msg_src|
  # msg：接收到的消息内容。
  # msg_src：一个 Addrinfo 对象，包含客户端的地址和端口信息。
  puts msg.inspect
  # msg_src.reply(msg)：向发送消息的客户端回复相同的消息。
  # msg_src.reply msg
}