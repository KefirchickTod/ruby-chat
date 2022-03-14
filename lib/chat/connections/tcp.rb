module Chat
  module Connections
    # Create tcp server or tcp socket for chat
    class TCP < Chat::Connection

      def server
        @client ||= TCPServer.new(@ip, @port)
      end

      def client
        @server ||= TCPSocket.new(@ip, @port)
      end
    end
  end
end