class ChangeStocksStockNameLimit30 < ActiveRecord::Migration[5.2]
  def up
    change_column :stocks, :stock_name, :string, limit: 30
  end

  def down
    change_column :stocks, :stock_name, :string
  end
end
