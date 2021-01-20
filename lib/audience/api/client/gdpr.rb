module Audience
  module Api
    class Client
      module Gdpr
        ENDPOINT = "gdpr".freeze
        # Performs a gdpr anonymisation for the given email address
        #
        # Example:
        #   Audience::Api.gdpr_anonymize("email@example.com")
        #
        def gdpr_anonymize(email)
          response = delete "#{ENDPOINT}/anonymize/?email=#{email}"
          response.body
        end
      end
    end
  end
end
