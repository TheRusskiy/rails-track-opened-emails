Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'postmark_opened', to: 'postmark#email_opened'
  post 'postmark_bounced', to: 'postmark#email_bounced'
end
