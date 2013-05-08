class RemoveCreatedFromStatuses < ActiveRecord::Migration
  def up
    remove_column :statuses, :created
  end

  def down
    add_column :statuses, :created, :datetime
  end
end
