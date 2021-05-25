class CreateSentEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :sent_emails do |t|
      t.text :email_name, null: false
      t.text :message_id
      t.references :entity, polymorphic: true, index: true
      t.integer :status, default: 0, null: false
      t.datetime :opened_at
      t.text :error
      t.timestamps

      t.index :email_name
      t.index :entity_id
      t.index :message_id
    end
  end
end
