class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cloth, null: false, foreign_key: true
      t.date :begin
      t.date :end

      t.timestamps
    end
  end
end
