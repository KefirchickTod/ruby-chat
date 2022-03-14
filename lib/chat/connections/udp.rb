module Chat
  module Connections
    class UDP < Chat::Connection

      attr_accessor :socket

      def server
        @socket = UDPSocket.open
        @socket.bind(@ip, @port)
        @socket
      end

      def client
        @socket = UDPSocket.new
        @socket.connect(@ip, @port)
        @socket
      end

    end
  end
end