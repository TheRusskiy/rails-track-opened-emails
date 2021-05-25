class PostmarkMailObserver
  def self.delivered_email(m)
    # only create a record if API has accepted the message
    return unless m.delivered?

    # as a part of API we are going to assume that
    # an email should be saved if "email_name" is set
    return unless m.metadata['email_name'].present?

    SentEmail.create(
      email_name: m.metadata['email_name'],
      status: 'sent',
      message_id: m.message_id,
      entity_id: m.metadata['entity_id'],
      entity_type: m.metadata['entity_type'],
      user_id: m.metadata['user_id'],
      subject: m.subject
    )
  end
end

ActionMailer::Base.register_observer(PostmarkMailObserver)
