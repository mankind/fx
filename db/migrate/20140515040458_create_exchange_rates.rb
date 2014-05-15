class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.date :date
      t.string :currency
      t.decimal :rate

      t.timestamps
    end
  end
end
