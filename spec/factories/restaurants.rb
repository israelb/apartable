# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    email  'aparta@apartamesa.com'
    password  'TheBeatles'
    password_confirmation 'TheBeatles'
  end

  factory :admin do
    after(:create) {|restaurant| restaurant.add_role(:admin)}
  end
end
