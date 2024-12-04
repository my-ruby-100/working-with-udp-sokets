# ---发送代码

# 将消息的总大小（包括前4个字节）作为消息的一部分
message_size = [message.bytesize].pack('N')  # 打包消息大小为 4 字节，'N' 表示网络字节序

# 合并大小信息和实际消息
full_message = message_size + message

# ---读取代码

# 接收数据
data, sender = server.recvfrom(1024)  # 每次最多接收 1024 字节
  
# 解析前4个字节，获得数据报的大小
message_size = data[0, 4].unpack1('N')  # 从数据的前4个字节解析出数据报大小 (大端字节序)

# 获取实际的消息内容
message = data[4, message_size]

