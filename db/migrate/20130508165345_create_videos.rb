class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :current
      t.belongs_to :track
      t.timestamps
    end
    add_index :videos, :track_id
  end
end
