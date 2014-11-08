class Restaurant < ActiveRecord::Base
  rolify # Rolify should be on the first line
  after_create :assign_default_role
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def assign_default_role
    add_role :admin
    puts "admin creado ---------------"
  end

  
end

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

