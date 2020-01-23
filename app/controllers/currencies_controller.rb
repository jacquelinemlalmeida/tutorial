class CurrenciesController < ApplicationController
before_action :set_currency

  def index
    @currencies = Currency.all
  end

  def set_currency
    @currency = Currency.where(locale: I18n.locale.to_s)
  end


end
