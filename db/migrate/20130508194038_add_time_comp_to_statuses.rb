class AddTimeCompToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :time_comp, :datetime
  end
end
