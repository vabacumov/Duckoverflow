class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, presence:true
  validates :title, length: { maximum: 140 }
  validates :content, presence:true

end
