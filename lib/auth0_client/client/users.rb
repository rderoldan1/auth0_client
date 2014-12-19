class Auth0::Client
  module Users

    def users(options={})
      token = authenticate["access_token"]
      path = "/api/users?access_token=#{token}"
      path.concat("&search=#{options[:criteria]}") if options[:criteria]
      get(path)
    end

    def user(user_id, options={})
      token = authenticate["access_token"]
      get("/api/users/#{user_id}?access_token=#{token}")
    end

  end
end