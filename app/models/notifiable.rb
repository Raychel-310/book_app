# app/models/concerns/notifiable.rb
module Notifiable
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  def notification_message
    raise NotImplementedError
  end

  def notification_path
    raise NotImplementedError
  end
end
