class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_blog_post(blog_post, subscriber)
    # by calling "store_message" we are saying that this
    # emails need to be saved in our database
    # for further tracking
    store_message(email_name: 'new_blog_post', entity: blog_post)

    mail(
      to: subscriber.email,
      subject: "New Post: #{blog_post.title}",
      track_opens: 'true'
    )
  end

  protected

  # email_name - some name we can later use for statistics
  # entity - any ActiveRecord model we want to associate the email with
  def store_message(email_name:, entity:)
    self.metadata['email_name'] = email_name.to_s.truncate(80)
    self.metadata['entity_id'] = entity.id
    self.metadata['entity_type'] = entity.class.name
  end
end
