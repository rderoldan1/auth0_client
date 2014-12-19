# Auth0Client

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'auth0_client', git: 'git@github.com:rderoldan1/auth0_client.git'
```

And then execute:

    $ bundle

Or install it yourself as(Soon):

    $ gem install auth0_client

## Usage

1. Create an initializer

    ```ruby
    #auth0.rb

    Auth0.configure do |config|
      config.endpoint       = 'https://example.net/api/v3' # API endpoint URL, default: ENV['AUTH0_ENDPOINT']
      config.client_id  = 'you_client_id'          # user's private token, default: ENV['AUTH0_CLIENT_ID']
      config.client_secret  = 'your_client_secret' # user's private token, default: ENV['AUTH0_CLIENT_SECRET']
      # Optional
      config.user_agent   = 'Custom User Agent'  # user agent, default: 'Auth0 Ruby Gem [version]'
    end
    ```

2. Call Auth0 API throught the ruby gem
    ```ruby
    client = Auth0.client
    client.users
    => [{"_id"=>"dacfc4d1721d2a7e57ae1cc22d65a9a0", "email_verified"=>false, "email"=>"jvidalba@gmail.com", "picture"=>"https://secure.gravatar.com/avatar/ab6039b08ce31a95a0f5a370f16cad77?s=480&r=pg&d=https%3A%2F%2Fssl.gstatic.com%2Fs2%2Fprofiles%2Fimages%2Fsilhouette80.png", "user_id"=>"auth0|54906433e1c87bbe090f35d4", "name"=>"Mateo Vidal", "nickname"=>"jvidalba", "identities"=>[{"user_id"=>"54906433e1c87bbe090f35d4", "provider"=>"auth0", "connection"=>"Username-Password-Authentication", "isSocial"=>false}], "created_at"=>"2014-12-16T16:56:19.272Z"}]
    ```


## Contributing

1. Fork it ( https://github.com/rderoldan1/auth0_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
