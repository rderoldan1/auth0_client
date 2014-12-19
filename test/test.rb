# puts File.expand_path("../../lib/auth0_client", __FILE__)
# require File.expand_path("../../lib/auth0_client.rb", __FILE__)
require 'auth0_client'

Auth0.configure do |config|
  config.endpoint = "https://jvidalba.auth0.com"
  config.client_id = "vuxwc9oTXYQTPqeeeucO3LAfOEfowGhO"
  config.client_secret = "0PPEPZasLzlWc8MxX8ZvMxgoTOMy30qrKkBLlTHd3ukP8GNFJkmNqqPAYOCpVHv1"
end

puts "Auth0.endpoint => #{Auth0.endpoint}"
puts "Auth0.clien_id => #{Auth0.client_id}"
puts "Auth0.client_secret => #{Auth0.client_secret}"

begin
  client = Auth0.client
  p Time.now
  p client.users(criteria: "loginsCount:10")
  p client.users
  p client.user("auth0|54906433e1c87bbe090f35d4")
  p "Creating users"
  p client.create_user("a@a.com", "121212")
  last_client = client.create_user("b@b.com", "131313", vip: true, last_name: "oelo")
  p "Updating email"
  p client.update_user_email(last_client["user_id"], "c@c.com")
  p Time.now
rescue => e
  puts e
end