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

client = Auth0.client
p Time.now
p client.users(criteria: "loginsCount:10")
p client.users
p Time.now