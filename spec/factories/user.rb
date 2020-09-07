# frozen_string_literal: true

FactoryBot.define do
  factory :valid_user, class: 'User' do
    name { 'John' }
    email { 's@s.com' }
    password { '1234' }
  end

  factory :in_valid_user, class: 'User' do
    name { 'J' }
    email { nil }
    password { nil }
  end

end
