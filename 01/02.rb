require 'socket'

# 1.7 创建第二个套接字

# 可以让你使用符号（而非常量）来描述各种选项
# `:INET`: `Socket::AF_INET`
# `:DGRAM`: `Socket::SOCK_DGRAM`
Socket.new(:INET, :DGRAM)