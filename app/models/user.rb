class User < ActiveRecord::Base
  rolify # Rolify should be the first line
  
  after_create :assign_default_role
  #after_create :send_welcome_mail
  

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :omniauthable, :recoverable, :rememberable, 
         :trackable, :validatable,
         :authentication_keys => [:username] # log in whith username

  validates :username, :presence => true, :uniqueness => {:case_sensitive => false}, :length => { :minimum => 3 }
            #:format => { :with => /\A[A-Z0-9a-z\w\b\ \-\_\'\!&@#\.]+\z/i,
            #:message => "may contain only alphanumeric characters and common special characters." }

  def assign_default_role
    add_role(:admin)
  end

=begin
  def self.from_omniauth_twitter(auth_token)
    where(auth_token.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth_token.provider
      user.uid = auth_token.uid
      user.username = auth_token.info.nickname
    end
  end
=end

  def self.from_omniauth_facebook(auth_token)
    data      = auth_token[:info]
    raw_info  = auth_token["extra"]["raw_info"]
    email     = data[:email]
    name      = data["name"]
    fb_uid    = auth_token["uid"]
    provider  = auth_token["provider"]
    username  = raw_info["username"]

    where(auth_token.slice(:provider, :uid)).first_or_create do |user|
      user.provider   = auth_token.provider
      user.uid        = auth_token.uid
      user.username   = username
      user.email      = email
    end
  end

=begin
  def self.find_first_by_auth_conditions(warden_conditions)

    conditions = warden_conditions.dup
    if login = conditions.delete(:username)
      # when allowing distinct User records with, e.g., "username" and "UserName"...
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
      
      #where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => username.downcase }]).first
    else
      where(conditions).first
    end
  end
=end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new session["devise.user_attributes"]  do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def send_welcome_mail
     Contact.welcome_email(self.email, self.name).deliver
  end


end
