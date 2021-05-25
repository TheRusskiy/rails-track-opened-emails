class EmailBouncedService
  def self.call(message_id:, error_message:)
    sent_email = SentEmail.find_by_message_id(message_id)

    return unless sent_email

    sent_email.update!(error: error_message, status: 'failed')
  end
end
