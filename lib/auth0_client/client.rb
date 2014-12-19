module Auth0
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each {|f| require f}

    include Users
  end
end