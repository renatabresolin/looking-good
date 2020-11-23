class AddColumnToRental < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :begin, :datetime
    add_column :rentals, :end, :datetime
  end
end
