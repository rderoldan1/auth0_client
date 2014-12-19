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
  p client.user("auth0|549498dfbb20ca598beb789d")
  p "Creating users"
  p client.create_user("a@a.com", "121212")
  last_client = client.create_user("b@b.com", "131313", vip: true, last_name: "oelo")
  p "Updating email"
  p client.update_user_email(last_client["user_id"], "c@c.com")
  p Time.now
  p "Updating password by id"
  p client.change_user_password_by_id(last_client["user_id"], "313131")
  p "Updating password by email"
  p client.change_user_password_by_email("c@c.com", "444444")
  # p "Deleting an user"
  # p client.delete_user(last_client["user_id"])
  p "Delete all users"
  p client.delete_users
rescue => e
  puts e
end