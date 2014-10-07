class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :reservation
      t.boolean :pool
      t.boolean :rec_room
      t.boolean :movie_theater
      t.boolean :on_site_doctor
      t.boolean :time_machine
    end
  end
end
