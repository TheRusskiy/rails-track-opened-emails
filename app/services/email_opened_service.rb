class EmailOpenedService
  def self.call(message_id:, first_open:)
    return unless first_open

    sent_email = SentEmail.find_by_message_id(message_id)
    return unless sent_email

    sent_email.update!(error: nil, status: 'opened', opened_at: Time.now)
  end
end
