module Audience
  module Api
    class Client
      module Gdpr
        ENDPOINT = "gdpr".freeze
        # Performs a gdpr removal for the given email address
        #
        # Example:
        #   Audience::Api.gdpr_removal("email@example.com")
        #
        def gdpr_removal(email)
          raise "No email given!" if email.blank?

          response = post(
            "#{ENDPOINT}/removal/",
            {email: email}.to_json
          )
          response.body
        end
      end
    end
  end
end
