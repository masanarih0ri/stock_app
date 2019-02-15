class AddUserToStocks < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM stocks;'
    add_reference :stocks, :user, null: false, index: true
  end

  def down
    remove_reference :stocks, :user, index: true
  end
end
