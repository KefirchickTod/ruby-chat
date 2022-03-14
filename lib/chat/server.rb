# frozen_string_literal: true

module Chat
  class Server
    attr_reader :clients

    def initialize(port, ip = "localhost")
      @server = Chat.default_connection.new(port, ip).server
      @clients = {}
    end

    # Create server for chat
    def listen
      loop do
        Thread.start(@server.accept) do |client|
          puts "Thank for connection"
          init_connection(client)
          listen_response(client)
        end
      end
    end

    private

    # Send to client first message with token
    def init_connection(client)
      token = SecureRandom.hex(10)
      @clients[token] = client

      puts "Generate new token: #{token}"

      client.puts(token)
    end

    def listen_response(client)
      Thread.new do
        loop do
          sleep 1 if client.gets.nil?
          response = JSON.parse(client.gets.chomp)
          token, body = response['token'], response['body']
          if invalid?(token)
            client.puts("Get invalid token: #{token}")
            raise ThreadError, "Invalid token"
          end
          puts "Response: #{body}"
          create_response(body)
        end
      end
    end

    def create_response(message)
      #return if @clients.length <= 1
      @clients.each do |token, client|
        #next if token == current
        client.puts(message)
      end
    end

    # Check if exist token
    def token?(token)
      @clients.key?(token)
    end

    def invalid?(token)
      !token?(token)
    end
  end
end
