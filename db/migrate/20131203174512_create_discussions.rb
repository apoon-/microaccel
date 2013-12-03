class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :project_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
