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

      # Perform an HTTP DELETE request
      def delete(path, options={})
        options["format"] = "json"
        connection.delete do |request|
          request.url URI.encode(path)
          request.params.merge! options
        end
      end
    end
  end
end
