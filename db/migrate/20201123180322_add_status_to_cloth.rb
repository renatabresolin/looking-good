class AddStatusToCloth < ActiveRecord::Migration[6.0]
  def change
    add_column :cloths, :status, :boolean
  end
end
