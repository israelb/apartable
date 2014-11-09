
describe HomeController do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:users]
    user = FactoryGirl.create(:user)
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    sign_in user
  end

  context "When you visit Home" do
    it "should have path root" do
      visit root_path
    end    
  end
  

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

  def login(user)
    post login_path, :login => user.login, :password => 'password'
  end

end