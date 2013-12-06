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
