class AddColumnToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :purchased, :boolean
  end
end
