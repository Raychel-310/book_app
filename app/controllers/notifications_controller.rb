class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def update
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true)
    redirect_to notifiable_path(notification)
  end

  private

  def notifiable_path(notification)
    if notification.notifiable_type === "Book"
      book_path(notification.notifiable.id) # 投稿に対する通知の場合はBookの詳細ページへ
    else
      user_path(notification.notifiable.user.id) # いいねに対する通知の場合はいいねをしたUserの詳細ページへ
    end
  end
end