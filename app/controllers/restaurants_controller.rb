class RestaurantsController < ApplicationController
  before_action :authenticate_restaurant!, :only => [:panel]

  def home
    render layout: "restaurantes"
  end

  def panel
  end
end
