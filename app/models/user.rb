class User < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :banner

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
end
