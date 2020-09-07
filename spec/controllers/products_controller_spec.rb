# frozen_string_literal: true
require 'rails_helper'
require 'jwt'

RSpec.describe ProductsController, type: :controller do
  describe "GET products#index" do
    let!(:user) { FactoryBot.build(:valid_user) }
    
    it 'should return 401 without login' do
      get "index"
      expect(response.status).to eq(401)
      expect(JSON.parse(response.body).dig("message")).to eq('Auth Token Required')
    end

    it 'Product list with Auth token' do
      user.save
      token = JWT.encode({user_id: user.id}.merge(expires_at: (Time.current + 42.hour).to_i), ENV['SECRET'])
      request.headers.merge({Authorization: token})
      get "index"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).dig("data")).to eq([])
    end
  end
end
