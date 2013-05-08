class AddVideoIdToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :video_id, :integer
  end
end
