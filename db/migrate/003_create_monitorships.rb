class CreateMonitorships < ActiveRecord::Migration[7.1]
  def change
    create_table :monitorships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
    
    add_index :monitorships, [:user_id, :subject_id], unique: true, if_not_exists: true
    add_index :monitorships, :subject_id, unique: true, if_not_exists: true
  end
end