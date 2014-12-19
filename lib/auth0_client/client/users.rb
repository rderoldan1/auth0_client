class Auth0::Client
  module Users

    def users(options={})
      get_auth_token do
        path = "/api/users?access_token=#{@token}"
        path.concat("&search=#{options[:criteria]}") if options[:criteria]
        get(path)
      end
    end

    def user(user_id, options={})
      get_auth_token do
        get("/api/users/#{user_id}?access_token=#{@token}")
      end
    end

    def get_auth_token
      @token = authenticate["access_token"]
      yield
    end

  end
end