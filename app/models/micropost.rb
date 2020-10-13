class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :relationships
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'micropost_id'
  has_many :favoriting_users, through: :reverses_of_favorite, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
end
