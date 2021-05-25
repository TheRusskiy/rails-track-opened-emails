class PostmarkMailObserver
  def self.delivered_email(m)
    return unless m.delivered?
    return unless m.metadata['email_name'].present?

    SentEmail.create(
      email_name: m.metadata['email_name'],
      status: 'sent',
      message_id: m.message_id,
      entity_id: m.metadata['entity_id'],
      entity_type: m.metadata['entity_type'],
      subject: m.subject
    )
  end
end

ActionMailer::Base.register_observer(PostmarkMailObserver)
