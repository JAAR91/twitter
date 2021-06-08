class Post < ApplicationRecord
    has_one_attached :picture
    belongs_to :user
    has_many :coments, dependent: :destroy

    scope :ordered_posts, -> { order('created_at DESC') }

    validates :body, presence: true
end
