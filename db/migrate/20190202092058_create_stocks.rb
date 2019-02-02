class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :stock_code
      t.string :stock_name
      t.integer :registered_year
      t.integer :registered_month
      t.float :per
      t.float :pbr
      t.float :capital_adequacy_ratio
      t.integer :last_year_sales
      t.integer :this_year_sales
      t.integer :next_year_sales
      t.integer :last_year_sales_profit
      t.integer :this_year_sales_profit
      t.integer :next_year_sales_profit
      t.integer :last_year_net_profit
      t.integer :this_year_net_profit
      t.integer :next_year_net_profit
      t.float :last_year_eps
      t.float :this_year_eps
      t.float :next_year_eps
      t.float :last_year_dividend
      t.float :this_year_dividend
      t.float :next_year_dividend
      t.float :this_year_dividend_yield
      t.text :comment

      t.timestamps
    end
  end
end
