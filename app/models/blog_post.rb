class BlogPost < ApplicationRecord
  has_many :sent_emails, dependent: :destroy

  def email_open_rate
    sent_emails.opened.count.fdiv(sent_emails.count)
  end
end
