module Chat
  class Client

    attr_accessor :client
    attr_reader :token

    def initialize(port, ip = 'localhost')
      @client = Chat.default_connection.new(port, ip).client
    end

    # Get response thread
    def listen
      Thread.new do
        loop do
          response = @client.gets.chomp

          puts "Get: #{response}"
          # massage = MassageFactory.generate(@client.chomp)
          register_token(response)

          # puts massage

          @client.puts("hello")

        end
      end
    end

    # Send massage to server
    def send(massage)
      body = {
        token: @token,
        body: massage,
        type: 'text'
      }.to_json

      @client.puts(body)
    end

    private

    def register_token(token)
      @token = token if @token.nil?

    end

  end
end