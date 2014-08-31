class User < ActiveRecord::Base
  validates :name, :username, :password, :email, presence:true
  validates :username, :email, uniqueness:true
  validates :password, length: { in: 6..30 }
  validates :name, :username, :email, length: { maximum: 30 }
  validates_format_of :email, with: /@/

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
end
