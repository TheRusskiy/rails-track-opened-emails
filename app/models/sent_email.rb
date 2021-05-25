class SentEmail < ApplicationRecord
  belongs_to :entity, polymorphic: true
  enum status: { sent: 0, opened: 1, failed: 2 }
  validates_presence_of :email_name, :status
  validates_presence_of :message_id, unless: :failed?
end
