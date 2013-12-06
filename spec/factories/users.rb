# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username  'elcomensal'
    email     'comensal@gmail.com'
    password  'TheBeatles'
    password_confirmation 'TheBeatles'
  end
end
