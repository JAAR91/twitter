class User < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :banner

  has_many :posts, dependent: :destroy

  has_many :followers, foreign_key: :user_id, dependent: :destroy
  has_many :inverted_followers, class_name: 'Follower', foreign_key: 'follow_id'

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
end
