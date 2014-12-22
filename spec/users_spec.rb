require 'spec_helper'

describe 'User API Endpoint' do

	before(:all) do
    @client = Auth0.client  
    @user = @client.create_user(Faker::Internet.email, Faker::Internet.password)
  end

  after(:all) do
    @client.delete_user(@user["user_id"])
  end

  describe "GET methods" do
    it 'should get all users' do
      users = @client.users
      expect(users.first["email"]).to eq(@user["email"])
      expect(users.first["user_id"]).to eq(@user["user_id"])
    end

    it 'should get all users with criteria' do
      users = @client.users(criteria: "loginsCount:10")
      expect(users).to be_empty
    end

    it 'should get a user by id' do
      user = @client.user(@user["user_id"])
      expect(user["email"]).to eq(@user["email"])
      expect(user["user_id"]).to eq(@user["user_id"])
    end
  end

  describe "POST methods" do
  end

  describe "PUT methods" do
  end

  describe "DELETE methods" do
  end
	
end