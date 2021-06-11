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

  validate :avatar_is_image
  validate :banner_is_image

  private

  def avatar_is_image
    if avatar.attached? && avatar.content_type !~ %r{^image/(jpeg|pjpeg|gif|png|bmp)$}
      return errors.add(:upload,
                        'Not a valid image on avatar')
    end
    nil
  end

  def banner_is_image
    if banner.attached? && banner.content_type !~ %r{^image/(jpeg|pjpeg|gif|png|bmp)$}
      return errors.add(:upload,
                        'Not a valid image on banner')
    end
    nil
  end
end
