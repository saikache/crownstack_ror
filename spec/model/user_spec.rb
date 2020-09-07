# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  context 'in-valid' do
    let!(:user) { FactoryBot.build :in_valid_user }

    it 'should return false for invalid user' do
      expect(user.valid?).to be false
    end

    it 'should return errors on email' do
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
      expect(user.errors[:email]).to include("is invalid")
    end
  end

  context 'should not allow duplicate emails' do
    let!(:user_1) { FactoryBot.build :valid_user }
    let!(:user_2) { FactoryBot.build :valid_user }

    it 'should return errors on email' do
      user_1.save
      user_2.valid?
      expect(user_2.errors[:email]).to include("has already been taken")
    end
  end

  context 'valid user' do
    let!(:user) { FactoryBot.build :valid_user }
    it 'should not return no errors for valid user' do
      expect(user.valid?).to be true
    end

  end
end
