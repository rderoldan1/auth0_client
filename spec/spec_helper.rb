require 'rubygems'
require 'rspec'
require 'bundler/setup'
require 'coveralls'

require File.expand_path('../../lib/auth0_client', __FILE__)

Coveralls.wear!

RSpec.configure do |config|
end

Auth0.configure do |config|
  config.endpoint       = 'https://rderoldan1.auth0.com' # API endpoint URL, default: ENV['AUTH0_ENDPOINT']
  config.client_id  = 'r9bDj41mVk2TFtdfLCi6qwICXRnDnGkA'          # user's private token, default: ENV['AUTH0_CLIENT_ID']
  config.client_secret  = 'OOQMedwUD_DT5Gq-YIW_kdytTps_n_uL8S_LBu81bclgLv-ROG_adHMxfJJyevvI' # user's private token, default: ENV['AUTH0_CLIENT_SECRET']
end