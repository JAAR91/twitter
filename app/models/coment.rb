class Coment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :ordered_coments, -> { order('created_at DESC') }

  validates :body, presence: true
end
