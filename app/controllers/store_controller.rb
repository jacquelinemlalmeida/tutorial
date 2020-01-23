class StoreController < ApplicationController
  include CurrentCart
  include CurrentCurrency
  skip_before_action :authorize
  before_action :set_cart
  before_action :set_currency

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else

      if session[:counter].nil?
        session[:counter]=0
      end
      session[:counter]+=1
      @page_title = "Book Store"

      @currency = set_currency
      @products = Product.all

    end
  end

end
