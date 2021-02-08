module Audience
  module Api
    # Defines HTTP request methods
    module Request
      # Perform an HTTP GET request
      def get(path, options={})
        options["format"] = "json"
        connection.get do |request|
          request.url URI.encode(path)
          request.params.merge! options
        end
      end

      # Perform an HTTP POST request
      def post(path, body = nil, options={})
        options["format"] = "json"
        connection.post do |request|
          request.url URI.encode(path)
          request.params.merge! options
          request.body = body if body
        end
      end
    end
  end
end
