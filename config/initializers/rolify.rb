Rolify.configure do |config|
  # By default ORM adapter is ActiveRecord. uncomment to use mongoid
  # config.use_mongoid
  
  
  # In order to avoid this error in rake db:migrate 
  # PG::UndefinedTable: ERROR: relation "roles" does not exist
  # The conditional is necesary
  if ActiveRecord::Base.connection.table_exists? 'roles'
    
    # Dynamic shortcuts for User class (user.is_admin? like methods). Default is: false
    # Enable this feature _after_ running rake db:migrate as it relies on the roles table
    #
    config.use_dynamic_shortcuts
  end

end