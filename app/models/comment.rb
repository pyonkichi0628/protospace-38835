class Comment < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :prototype

  #バリデーション
  validates :content,       presence: true

end
