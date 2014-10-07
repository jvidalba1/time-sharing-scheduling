class AddRateToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :rate, :integer
  end
end
