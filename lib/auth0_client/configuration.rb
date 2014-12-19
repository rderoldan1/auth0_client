module Auth0
  module Configuration
    # An array of valid keys in the options hash when configuring a Gitlab::API.
    VALID_OPTIONS_KEYS = [:endpoint, :client_id, :client_secret, :user_agent, :sudo, :httparty].freeze

    attr_accessor(*VALID_OPTIONS_KEYS)

    # Sets all configuration options to their default values
    # when this module is extended.
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block.
    def configure
      yield self
    end

    # Resets all configuration options to the defaults.
    def reset
      self.endpoint       = ENV['AUTH0_ENDPOINT']
      self.client_id      = ENV['AUTH0_CLIENT_ID']
      self.client_secret  = ENV['AUTH0_CLIENT_SECRET']
      # self.user_agent     = DEFAULT_USER_AGENT
    end

    # Creates a hash of options and their values.
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

  end
end
