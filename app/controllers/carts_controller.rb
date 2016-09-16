class CartsController < ApplicationController
  def index
    @carts = current_cart.line_items
    @cart = current_cart
  end
end
