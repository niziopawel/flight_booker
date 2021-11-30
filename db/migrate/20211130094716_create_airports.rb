class CreateAirports < ActiveRecord::Migration[6.1]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :code

      t.timestamps
    end
  end
end
