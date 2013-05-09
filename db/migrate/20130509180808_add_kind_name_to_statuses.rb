class AddKindNameToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :kind_name, :string
  end
end
