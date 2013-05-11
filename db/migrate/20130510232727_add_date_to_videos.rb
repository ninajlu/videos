class AddDateToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :dateFilmed, :datetime
  end
end
