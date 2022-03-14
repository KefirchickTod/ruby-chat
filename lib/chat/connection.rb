module Chat
  class Connection

    attr_accessor :ip, :port

    def initialize(port, ip = "localhost")
      @ip = ip
      @port = port
    end

    # Create client connection to tcp
    def client
      raise "You call not implement funtion"
    end

    # Create server connection
    def server
      raise "You call not implement funtion"
    end

  end



end