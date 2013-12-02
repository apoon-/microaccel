class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :goal_in_cents
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
