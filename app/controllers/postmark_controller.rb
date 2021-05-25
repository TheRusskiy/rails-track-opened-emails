class PostmarkController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # TODO: use real credentials for basic auth
  http_basic_authenticate_with name: "SECRET_NAME", password: "SECRET_PASSWORD"

  def email_opened
    EmailOpenedService.call(
      message_id: params[:MessageID],
      first_open: params[:FirstOpen]
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
