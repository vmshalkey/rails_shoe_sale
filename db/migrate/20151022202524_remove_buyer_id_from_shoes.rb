class RemoveBuyerIdFromShoes < ActiveRecord::Migration
  def change
  	remove_column :shoes, :buyer_id, :integer
  end
end
