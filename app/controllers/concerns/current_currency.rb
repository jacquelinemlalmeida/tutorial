module CurrentCurrency

  def set_currency
    @currency = Currency.where(locale: I18n.locale.to_s)
    @currency[0].currency
  end

end
