require 'spec_helper'

describe 'Validate config are loaded' do

  it 'should read client_id' do
    expect(Auth0.client_id).to be_an String
    expect(Auth0.client_id).not_to be_an NilClass
  end

  it 'should read client_secret' do
    expect(Auth0.client_secret).to be_an String
    expect(Auth0.client_secret).not_to be_an NilClass
  end

  it 'should read endpoint URL' do
    expect(Auth0.endpoint).to be_an String
    expect(Auth0.endpoint).not_to be_an NilClass
    expect(Auth0.endpoint).to match( URI.regexp )
  end
end