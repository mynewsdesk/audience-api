module Audience
  module Api
    class Client
      # see http://mnd-audience.herokuapp.com/docu/#!/contacts
      module Contact
        ENDPOINT = "contacts".freeze

        # Returns single contact by id
        #
        # Example:
        #   Audience::Api.contact(25)
        #
        def contact(*args)
          options = args.last.is_a?(Hash) ? args.pop : {}
          id = args.first
          response = get "#{ENDPOINT}/#{id}/", options
          response.body
        end

        # Returns all contacts for given list_id
        #
        # Example:
        #   Audience::Api.list_contacts(19)
        #
        def list_contacts(*args)
          options = args.last.is_a?(Hash) ? args.pop : {}
          list_id = args.first
          raise "No list_id given!" if list_id.nil?

          response = get ENDPOINT, options.merge(list_id: list_id)
          response.body
        end
      end
    end
  end
end
