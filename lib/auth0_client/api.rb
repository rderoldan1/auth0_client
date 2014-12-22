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

    def get_access_token
      post("/oauth/token", body: {
                             client_id:      @client_id,
                             client_secret:  @client_secret,
                             grant_type:     "client_credentials"
                         }).merge({ timestamp: Time.now })
    end

    def authenticate
      if @access_token
        if @access_token[:timestamp] < Time.now - 60*60*20
          @access_token = get_access_token
        else
          @access_token
        end
      else
        @access_token = get_access_token
      end
    end

    private

    # Private: Maintain the session across the requests
    # Params: Block of code that needs to be authenticated previously
    def get_auth_token
      @token = authenticate["access_token"]
      yield
    end

  end
end