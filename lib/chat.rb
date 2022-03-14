# frozen_string_literal: true

require 'socket'
require 'securerandom'
require 'json'

require_relative "chat/version"
require_relative "chat/connection"
require_relative "chat/connections/tcp"
require_relative "chat/connections/udp"

module Chat

  class Error < StandardError; end

  MAX_CONNECTION = 10
  CONNECTION_TIMEOUT = 10

  class << self

    attr_writer :default_connection

    def default_connection
      @default_connection ||= Chat::Connections::TCP
    end

    def server

    end

    def client

    end

  end

end

require_relative "chat/massage"
require_relative "chat/client"
require_relative "chat/server"



