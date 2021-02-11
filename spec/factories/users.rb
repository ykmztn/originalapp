FactoryBot.define do
  factory :user do
    nickname { 'samplename' }
    email { 'sample@email' }
    password { 'abc123' }
    password_confirmation { password }
    gender { 2 }
    age { 2 }
  end
end
