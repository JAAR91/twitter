class Post < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :coments, dependent: :destroy

  scope :ordered_posts, -> { order('created_at DESC') }

  validates :body, presence: true
  validate :upload_is_image

  private

  def upload_is_image
    if picture.attached? && picture.content_type !~ %r{^image/(jpeg|pjpeg|gif|png|bmp)$}
      errors.add(:upload, 'Not a valid image')
    end
    nil
  end
end
