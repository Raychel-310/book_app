class Notification < ApplicationRecord
  include Rails.application.routes.url_helpers
  extend ActiveSupport::Concern

  belongs_to :user
  belongs_to :notifiable, polymorphic: true
  
  def message
    notifiable.notification_message
  end

  def notifiable_path
    notifiable.notification_path
  end
end

# app/models/concerns/notifiable.rb
# module Notifiable
#   extend ActiveSupport::Concern

#   included do
#     include Rails.application.routes.url_helpers
#   end

#   def notification_message
#     raise NotImplementedError
#   end

#   def notification_path
#     raise NotImplementedError
#   end
# end
