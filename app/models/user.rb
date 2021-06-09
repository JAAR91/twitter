class User < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :banner

  has_many :posts, dependent: :destroy
  has_many :coments, dependent: :destroy

  has_many :followers, foreign_key: :user_id, dependent: :destroy
  has_many :inverted_followers, class_name: 'Follower', foreign_key: 'follow_id'

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true

  validate :upload_is_image

  private

  def upload_is_image
    if avatar.attached?
      errors.add(:upload, "Not a valid image") unless avatar.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/
    end

    if banner.attached?
      errors.add(:upload, "Not a valid image") unless banner.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/
    end
  end
end
