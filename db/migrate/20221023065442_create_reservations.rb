class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.time :start_date
      t.time :end_date
      t.integer :how_many
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
