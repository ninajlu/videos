class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :type
      t.text :comment
      t.boolean :completed
      t.datetime :created
      t.datetime :completed
      t.integer :video_id
      t.timestamps
    end
    add_index :statuses, :video_id
  end
end
