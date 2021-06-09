class Post < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :coments, dependent: :destroy

  scope :ordered_posts, -> { order('created_at DESC') }

  validates :body, presence: true
  validate :upload_is_image

  private

  def upload_is_image
    if picture.attached?
      errors.add(:upload, "Not a valid image") unless picture.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/
    end
  end
end
