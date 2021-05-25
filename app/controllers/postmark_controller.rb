class PostmarkController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # we are going to secure this webhook endpoint by using basic auth,
  # when defining your webhook on Postmark you should set it as
  # https://<username>:<password>@example.com/postmark_opened
  # https://<username>:<password>@example.com/postmark_bounced
  # TODO: use real credentials for basic auth
  http_basic_authenticate_with name: "SECRET_NAME", password: "SECRET_PASSWORD"

  def email_opened
    EmailOpenedService.call(
      message_id: params[:MessageID],
      first_open: params[:FirstOpen],
      opened_at: params[:ReceivedAt]
    )
    render json: { status: 201 }
  end

  def email_bounced
    EmailBouncedService.call(
      message_id: params[:MessageID],
      error_message: params[:Description]
    )
    render json: { status: 201 }
  end
end
