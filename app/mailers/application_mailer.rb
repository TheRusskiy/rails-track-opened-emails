class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_blog_post(blog_post, subscriber)
    store_message(email_name: 'new_blog_post', entity: blog_post)

    mail(to: subscriber.email, subject: "New Post: #{blog_post.title}")
  end

  protected

  def store_message(email_name:, entity:)
    self.metadata['email_name'] = email_name.to_s.truncate(80)
    self.metadata['entity_id'] = entity.id
    self.metadata['entity_type'] = entity.class.name
  end
end
