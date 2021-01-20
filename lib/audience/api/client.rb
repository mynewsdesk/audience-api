require File.expand_path("../connection", __FILE__)
require File.expand_path("../request", __FILE__)

module Audience
  module Api
    class Client
      module Initialization
        attr_accessor *Configuration::VALID_OPTIONS_KEYS

        # Creates a new client
        def initialize(options={})
          options = Audience::Api.options.merge(options)

          Configuration::VALID_OPTIONS_KEYS.each do |key|
            send("#{key}=", options[key])
          end
        end

        # Sanitize config
        def config
          conf = {}
          Configuration::VALID_OPTIONS_KEYS.each do |key|
            conf[key] = send key
          end
          conf
        end
      end

      include Initialization
      include Connection
      include Request

      Dir[File.expand_path("../client/*.rb", __FILE__)].each { |f| require f }
      include Audience::Api::Client::Contact
      include Audience::Api::Client::Gdpr
      include Audience::Api::Client::List
      include Audience::Api::Client::AutoPaginate
    end
  end
end
