class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.timestamps
    end

    create_table :reservations do |t|
      t.belongs_to :user
      t.date :date
      t.integer :rooms
      t.string :trip_reason
      t.timestamps
    end

    create_table :ratings do |t|
      t.integer :rate
      t.belongs_to :reservation
      t.timestamps
    end
  end
end
