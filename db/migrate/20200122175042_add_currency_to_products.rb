class AddCurrencyToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :currency, :decimal, precision: 10, scale: 2
  end
end
