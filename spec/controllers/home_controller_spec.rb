require 'spec_helper'

describe HomeController do
  context "When you visit Home" do
    it "should have path root" do
      visit root_path
    end    
  end
  
  login_user

  it "should have a current_user" do
    # note the fact that I removed the "validate_session" parameter if this was a scaffold-generated controller
    subject.current_user.should_not be_nil
  end

  it "should get panel control" do
    # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
    # the valid_session overrides the devise login. Remove the valid_session from your specs
    get 'index'
    response.should be_success
  end

  it "should be an admin" do
    subject.current_user.should be_has_role :admin
  end

end