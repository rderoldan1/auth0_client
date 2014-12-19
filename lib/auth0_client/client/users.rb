class Auth0::Client
  module Users
    def users(options={})
      token = authenticate["access_token"]
      get("/api/users?access_token=#{token}")
    end
  end
end