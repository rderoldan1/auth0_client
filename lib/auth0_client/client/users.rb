class Auth0::Client
  module Users
    def users(options={})
      p authenticate
      get("/users")
    end
  end
end