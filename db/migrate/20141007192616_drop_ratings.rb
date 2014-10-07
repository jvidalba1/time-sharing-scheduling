class DropRatings < ActiveRecord::Migration
  def up
    drop_table :ratings
  end

  def down
    create_table :ratings do |t|
      t.integer :rate
      t.timestamps
    end
  end
end
