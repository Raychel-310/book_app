class Book < ApplicationRecord
  include Notifiable
  belongs_to :user
  has_many :book_comments
  has_many :favorites
  has_many :notifications, as: :notifiable, dependent: :destroy
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def notification_message
    "フォローしている#{user.name}さんが#{title}を投稿しました"
  end

  def notification_path
    book_path(self)
  end
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      where("title = ?", word)
    elsif search == "partial_match"
      where("title LIKE ?", "%#{word}%")
    else
      where("title LIKE ?", "#{word}%")
    end
  end
  
  after_create do
    records = user.followers.map do |follower|
      notifications.new(user_id: follower.id)
    end # ・・・　①
    Notification.import records # ・・・ ②
  end

end
