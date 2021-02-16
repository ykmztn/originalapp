FactoryBot.define do
  factory :pose do
    title { 'sampletitle' }
    effect_id { 2 }
    minute { 1 }
    intensity_id { 2 }

    association :user

    after(:build) do |pose|
      pose.image.attach(io: File.open('public/images/sample-for-test.png'), filename: 'sample-for-test.png')
    end
  end
end
