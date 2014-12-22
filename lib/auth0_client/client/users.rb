class Auth0::Client
  module Users
    #GET Methods

    # Public: Get all users, if options contains a criteria, it perform a search
    # Params:
    #       - options: {
    #           criteria: string of conditions : email_verified:true; loginsCount:1; family_name:"johnson"
    #       }
    # Return: array of users
    def users(options={})
      get_auth_token do
        path = "/api/users?access_token=#{@token}"
        path.concat("&search=#{options[:criteria]}") if options[:criteria]
        get(path)
      end
    end

    # Public: Get a user given an user_id
    # Params:
    #       - user_id: string
    #       - options: hash
    # Return: user
    def user(user_id, options={})
      get_auth_token do
        get("/api/users/#{user_id}?access_token=#{@token}")
      end
    end

    #POST Methods

    # Public: Delete a user given an user_id
    # Params:
    #       - user_id: string
    #       - options: hash
    # Return: user
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

    #PUT Methods

    # Public: Update user's email given an user_id
    # Params:
    #       - user_id: string
    #       - email: string
    #       - options: {verify: boolean, send verification email before proceed with the change}
    def update_user_email(user_id, email, options={})
      get_auth_token do
        body = {
            email: email,
            # verify: false
        }.merge(options)
        put("/api/users/#{user_id}/email?access_token=#{@token}", body: body)
      end
    end

    # Public: Update user's email given an user_id
    # Params:
    #       - user_id: string
    #       - password: string
    #       - options: {verify: boolean, send verification email before proceed with the change}
    def change_user_password_by_id(user_id, password, options={})
      get_auth_token do
        body = {
            password: password,
            # verify: false
        }.merge(options)
        put("/api/users/#{user_id}/password?access_token=#{@token}", body: body)
      end
    end

    # Public: Update user's email given an user_id
    # Params:
    #       - email: string
    #       - password: string
    #       - options: {verify: boolean, send verification email before proceed with the change} 
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

    #DELETE Methods

    # Public: Delete all the users related with an access token
    def delete_users
      get_auth_token do
        delete("/api/users?access_token=#{@token}")
      end
    end

    # Public: Delete a user given an user_id
    # Params:
    #       - user_id: string
    #       - options: hash
    def delete_user(user_id, options={})
      get_auth_token do
        delete("/api/users/#{user_id}?access_token=#{@token}")
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