class RemoveKindNameFromStatuses < ActiveRecord::Migration
  def up
    remove_column :statuses, :kind_name
  end

  def down
    add_column :statuses, :kind_name, :string
  end
end
