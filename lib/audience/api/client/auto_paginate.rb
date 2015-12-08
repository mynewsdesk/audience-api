module Audience
  module Api
    class Client
      # Auto pagination functionality
      #
      # Example:
      #   Audience::Api.auto_paginate :list_contacts, 2 do |batch|
      #     pp batch
      #   end
      module AutoPaginate
        # Yields given block within collection
        def auto_paginate(api_method, *args, &block)
          options = args.last.is_a?(Hash) ? args.pop : {}
          options["page"] = 1

          begin
            response = public_send api_method, *args, options
            yield response[:results]
          end while options["page"] = extract_next_page(response[:pagination])
        end

        private

        # Internal:
        #   pagination - hash with pagination urls
        #
        # Example:
        #   extract_next_page(next: 'http://localhost:3000/contacts?list_id=2&page=2')
        #     => 2
        def extract_next_page(pagination)
          return nil if pagination[:next].nil?

          CGI.parse(URI.parse(pagination[:next]).query)["page"].first
        rescue
          nil
        end
      end
    end
  end
end
