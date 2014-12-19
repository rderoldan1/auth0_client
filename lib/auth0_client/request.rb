require 'httparty'
require 'json'

module Auth0
  class Request
    include HTTParty
    format :json
    headers 'Accept' => 'application/json'

    def get(path, options={})
      validate self.class.get(URI.encode(@endpoint + path), options)
    end

    def post(path, options={})
      validate self.class.post(URI.encode(@endpoint + path), options)
    end

    def put(path, options={})
      validate self.class.put(URI.encode(@endpoint + path), options)
    end

    def delete(path, options={})
      validate self.class.delete(URI.encode(@endpoint + path), options)
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

    # Sets a base_uri and default_params for requests.
    # @raise [Error::MissingCredentials] if endpoint not set.
    def set_request_defaults(endpoint, client_id, client_secret)
      raise Error::MissingCredentials.new("Please set an endpoint to API") unless endpoint
      @client_id = client_id
      @endpoint = endpoint
      @client_secret = client_secret
    end

    private

      def error_message(response)
        "Server responded with code #{response.code}, message: #{response.parsed_response}. " \
        "Request URI: #{response.request.base_uri}#{response.request.path}"
      end
  end
end

