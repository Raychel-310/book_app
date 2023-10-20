class BookComment < ApplicationRecord
    belongs_to :user
    belongs_to :book
    
    validates :body, presence: true
end
