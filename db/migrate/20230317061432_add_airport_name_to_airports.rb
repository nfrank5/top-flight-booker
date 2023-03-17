class AddAirportNameToAirports < ActiveRecord::Migration[7.0]
  def change
    add_column :airports, :airport_name, :string
  end
end
