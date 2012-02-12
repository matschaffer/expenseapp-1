class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.date :date
      t.integer :rating
      t.string :review
      t.belongs_to :user

      t.timestamps
    end
    add_index :restaurants, :user_id
  end
end
