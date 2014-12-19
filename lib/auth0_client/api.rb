module Auth0
  # @private
  class API < Request
    # @private
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    # Creates a new API.
    # @raise [Error:MissingCredentials]
    def initialize(options={})
      options = Auth0.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
      set_request_defaults @endpoint, @client_id, @client_secret
    end

    def authenticate
      @access_token ||= post("/oauth/token", body: {
                                                      client_id:      @client_id,
                                                      client_secret:  @client_secret,
                                                      grant_type:     "client_credentials"
                                                    })
    end
  end
end