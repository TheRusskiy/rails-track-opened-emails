class AddUserToSentEmails < ActiveRecord::Migration[6.1]
  def change
    add_reference :sent_emails, :user, foreign_key: true, null: true, index: true
  end
end
