class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :amount_in_cents

      t.timestamps
    end
  end
end
