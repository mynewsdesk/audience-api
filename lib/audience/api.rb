require File.expand_path("../api/version", __FILE__)
require File.expand_path("../api/configuration", __FILE__)
require File.expand_path("../api/client", __FILE__)

module Audience::Api
  extend Configuration

  def self.client(options={})
    Audience::Api::Client.new(options)
  end

  # Delegate to Audience::Api::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Audience::Api::Client
  def self.respond_to?(method, include_all=false)
    return client.respond_to?(method, include_all) || super
  end
end
