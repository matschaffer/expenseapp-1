class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :description
      t.decimal :amount

      t.timestamps
    end
  end
end
