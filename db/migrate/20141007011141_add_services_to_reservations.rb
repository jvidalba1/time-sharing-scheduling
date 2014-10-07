class AddServicesToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :pool, :boolean
    add_column :reservations, :rec_room, :boolean
    add_column :reservations, :movie_theater, :boolean
    add_column :reservations, :on_site_doctor, :boolean
    add_column :reservations, :time_machine, :boolean
  end
end
