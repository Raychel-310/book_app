class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments
  has_many :favorites
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
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
end
