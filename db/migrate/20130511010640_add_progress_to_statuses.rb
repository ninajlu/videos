class AddProgressToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :progress, :string
  end
end
