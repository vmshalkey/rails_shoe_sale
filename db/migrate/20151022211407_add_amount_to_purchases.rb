class AddAmountToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :amount, :decimal
  end
end
