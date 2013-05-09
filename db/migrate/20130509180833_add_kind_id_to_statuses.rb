class AddKindIdToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :kind_id, :integer
  end
end
