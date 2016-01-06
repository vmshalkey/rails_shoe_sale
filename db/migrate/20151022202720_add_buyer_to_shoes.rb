class AddBuyerToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :buyer, :string
  end
end
