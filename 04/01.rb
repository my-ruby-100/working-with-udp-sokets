require 'socket'

socket = UDPSocket.new
socket.send("Hello UDP Server", 0, '127.0.0.1', '9911')
socket.close