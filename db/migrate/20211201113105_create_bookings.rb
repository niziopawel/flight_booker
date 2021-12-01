class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :flight, foreign_key: true, null: false

      t.timestamps
    end
  end
end
