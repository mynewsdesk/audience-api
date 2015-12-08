module Audience
  module Api
    class Client
      # see http://mnd-audience.herokuapp.com/docu/#!/lists
      module List
        ENDPOINT = "lists".freeze

        # Returns single list by id
        #
        # Example:
        #   Audience::Api.list(25)
        #
        def list(*args)
          options = args.last.is_a?(Hash) ? args.pop : {}
          id = args.first
          response = get "#{ENDPOINT}/#{id}/", options
          response.body
        end

        # Returns all lists for country
        #
        # Example:
        #   Audience::Api.country_lists("de")
        #
        def country_lists(*args)
          options = args.last.is_a?(Hash) ? args.pop : {}
          country_code = args.first
          raise "No country code given!" if country_code.nil?

          response = get ENDPOINT, options.merge(country_code: country_code)
          response.body
        end
      end
    end
  end
end
