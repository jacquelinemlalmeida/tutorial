require 'rest-client'
require 'json'

class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :authorize
  protect_from_forgery with: :exception
  before_action :get_currencies_from_api

  def get_currencies_from_api
    url = 'https://economia.awesomeapi.com.br/all/'
    q = 'USD-BRL,EUR-BRL'
    resp = JSON.parse(RestClient.get "#{url}")
    currency_map = {
        :en => resp['USD']['high'].to_s,
        :es => resp['EUR']['high'].to_s
    }
    currency_map.each do |currency_name, currency|
      Currency.where(locale: currency_name).update_all(currency:  currency)
    end


  end

  protected

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

end
