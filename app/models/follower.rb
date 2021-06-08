class Follower < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'

  has_many :posts, through: :follow
end
