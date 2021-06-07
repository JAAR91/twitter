class Post < ApplicationRecord
    belongs_to :user

    scope :ordered_posts, -> { order('created_at DESC') }
end
