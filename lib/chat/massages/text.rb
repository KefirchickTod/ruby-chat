module Chat
  module Massages
    class Text < Chat::Massage

      attr_accessor :content

      def initialize(content)
        @content = content
        super
      end

      class << self
        def read

        end
      end

      def to_s
        @content
      end

    end
  end
end