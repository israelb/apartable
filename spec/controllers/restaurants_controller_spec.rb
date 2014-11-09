
describe RestaurantsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:restaurants]
    restaurant = FactoryGirl.create(:restaurant) # Using factory girl as an example
    sign_in restaurant
  end

  context "When you visit resturantes" do
    it "should have path restaurantes" do
      visit restaurantes_path
    end    
  end
  

  it "should have a current_restaurant" do
    # note the fact that I removed the "validate_session" parameter if this was a scaffold-generated controller
    subject.current_restaurant.should_not be_nil
  end

  it "should get panel control" do
    # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
    # the valid_session overrides the devise login. Remove the valid_session from your specs
    get 'panel'
    response.should be_success
  end

  it "should be an admin" do
    subject.current_restaurant.should be_has_role :admin
  end
end