class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.decimal :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
