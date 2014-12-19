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

    def create_user(email, password, options={})
      get_auth_token do
        body = {  email: email,
                  password: password,
                  connection: "Username-Password-Authentication"#,
                  # email_verified: false
                }.merge(options)
        post("/api/users?access_token=#{@token}", body: body)
      end
    end

    def update_user_email(user_id, email, options={})
      get_auth_token do
        body = {
          email: email,
          # verify: false
        }.merge(options)
        put("/api/users/#{user_id}/email?access_token=#{@token}", body: body)
      end
    end

    def change_user_password_by_id(user_id, password, options={})
      get_auth_token do
        body = {
          password: password,
          # verify: false
        }.merge(options)
        put("/api/users/#{user_id}/password?access_token=#{@token}", body: body)
      end
    end

    def change_user_password_by_email(email, password, options={})
      get_auth_token do
        body = {
          email: email,
          password: password,
          connection: "Username-Password-Authentication"#,
          # verify: false
        }.merge(options)
        put("/api/users/#{email}/password?access_token=#{@token}", body: body)
      end
    end

    def delete_users
      get_auth_token do
        delete("/api/users?access_token=#{@token}")
      end
    end

    def delete_user(user_id, options={})
      get_auth_token do
        delete("/api/users/#{user_id}?access_token=#{@token}")
      end
    end

    private

      def get_auth_token
        @token = authenticate["access_token"]
        yield
      end

  end
end