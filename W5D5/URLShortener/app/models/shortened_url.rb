require 'securerandom'

class ShortenedUrl < ApplicationRecord

  validates :long_url, :short_url, :user_id, presence: true
  validates :user_id, uniqueness: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.set_short_url
    random_string = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(random_string)
      random_string = SecureRandom.urlsafe_base64
    end

    self.short_url = random_string
  end



end