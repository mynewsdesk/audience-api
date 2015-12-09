require "faraday_middleware"
require File.expand_path("../faraday_middleware/pagination_parser", __FILE__)

module Audience
  module Api
    module Connection
      private

      def connection
        options = {
          headers: {
            "Content-Type" => "application/json",
            "User-Agent" => "MND-Audience API gem"
          },
          url: endpoint,
        }

        Faraday::Connection.new(options) do |connection|
          connection.basic_auth user, password
          connection.use Faraday::Request::UrlEncoded
          connection.use Faraday::Response::RaiseError
          connection.use Audience::Api::FaradayMiddleware::PaginationParser
          connection.use ::FaradayMiddleware::Mashify
          connection.use Faraday::Response::ParseJson
          connection.adapter(adapter)
        end
      end
    end
  end
end
