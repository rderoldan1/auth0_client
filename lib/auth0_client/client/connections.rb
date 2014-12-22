class Auth0::Client
  module Connections
    # Get methods
    def connections
      get_auth_token do
        get("/api/connections?access_token=#{@token}")
      end
    end

    def connection(connection_name)
      get_auth_token do
        get("/api/connections/#{connection_name}?access_token=#{@token}")
      end
    end

    # Post methods
    def create_connection(name, strategy, options={})
      body = {
          name: name,
          strategy: strategy,
          options: options
      }
      get_auth_token do
        post("/api/connections?access_token=#{@token}")
      end
    end

    # Put methods
    def update_connection(connection_name)
      get_auth_token do
        get("/api/connections/#{connection_name}?access_token=#{@token}")
      end
    end

    # Delete methods
    def delete_connection(connection_name)
      get_auth_token do
        delete("/api/connections/#{connection_name}?access_token=#{@token}")
      end
    end
  end
end