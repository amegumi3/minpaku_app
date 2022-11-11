class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :price
      t.string :introduction
      t.string :adress

      t.timestamps
    end
  end
end
