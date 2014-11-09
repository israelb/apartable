class RestaurantsController < ApplicationController
  before_action :authenticate_restaurant!, :only => [:panel]

  # Landing page Restaurantes
  def home
    render layout: "restaurantes"
  end

  # Panel admin for restarunts
  def panel
    render layout: "restaurantes_panel"
  end
end
