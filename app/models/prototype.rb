class Prototype < ApplicationRecord
  #アソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :image

  #カラムバリデーション
  validates :title,            presence: true
  validates :catch_copy,       presence: true
  validates :concept,          presence: true
  validates :user,             presence: true
  validates :image,            presence: true
  
 
end
