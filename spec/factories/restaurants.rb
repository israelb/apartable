# == Schema Information
#
# Table name: restaurants
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_restaurants_on_email                 (email) UNIQUE
#  index_restaurants_on_reset_password_token  (reset_password_token) UNIQUE
#

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
