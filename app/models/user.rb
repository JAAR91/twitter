class User < ApplicationRecord
  has_one_attached :avatar

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
end
