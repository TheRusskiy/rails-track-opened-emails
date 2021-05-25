class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :email, null: false
      t.text :name, null: false
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
