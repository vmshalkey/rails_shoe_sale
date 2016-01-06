class AddBuyerColumnToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :buyer_id, :integer
  end
end
