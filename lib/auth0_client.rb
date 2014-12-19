require "auth0_client/version"
require 'auth0_client/configuration'
require 'auth0_client/error'
require 'auth0_client/request'
require 'auth0_client/api'
require 'auth0_client/client'

module Auth0
  extend Configuration

  # Alias for Auth0::Client.new
  #
  # @return [Auth0::Client]
  def self.client(options={})
    Auth0::Client.new(options)
  end

  # Delegate to Gitlab::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Gitlab::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end
