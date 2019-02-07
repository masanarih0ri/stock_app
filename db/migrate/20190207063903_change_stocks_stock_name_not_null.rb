class ChangeStocksStockNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :stocks, :stock_name, false
  end
end
