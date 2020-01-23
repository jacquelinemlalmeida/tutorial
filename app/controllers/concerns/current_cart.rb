module CurrentCart
private

  def set_cart
    @cart = Cart.find_by_id(session[:cart_id])
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

end
