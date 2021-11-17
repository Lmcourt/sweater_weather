FactoryBot.define do
  factory :user do
    email { 'email@email.com'}
    password { 'motdepass'}
    password_confirmation { 'motdepass'}
  end
end
