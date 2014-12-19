require 'httparty'
require 'json'

module Auth0
  module Request
    include HTTParty
    format :json
    headers 'Accept' => 'application/json'

    def get(path, options={})
      validate self.class.get(path, options)
    end

    def post(path, options={})
      validate self.class.get(path, options)
    end

    def put(path, options={})
      validate self.class.get(path, options)
    end

    def delete(path, options={})
      validate self.class.get(path, options)
    end

    # Checks the response code for common errors.
    # Returns parsed response for successful requests.
    def validate(response)
      case response.code
        when 400; raise Error::BadRequest.new error_message(response)
        when 401; raise Error::Unauthorized.new error_message(response)
        when 403; raise Error::Forbidden.new error_message(response)
        when 404; raise Error::NotFound.new error_message(response)
        when 405; raise Error::MethodNotAllowed.new error_message(response)
        when 409; raise Error::Conflict.new error_message(response)
        when 500; raise Error::InternalServerError.new error_message(response)
        when 502; raise Error::BadGateway.new error_message(response)
        when 503; raise Error::ServiceUnavailable.new error_message(response)
      end

      response.parsed_response
    end

  end
end

