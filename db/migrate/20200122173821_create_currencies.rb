class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.decimal :currency, precision: 10, scale: 2
    end
  end
end
