class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :academic_record, null: false
      t.string :password_digest, null: false
      t.integer :role, default: 0, null: false

      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :academic_record, unique: true
  end
end