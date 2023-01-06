class Comment < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :prototype

  #バリデーション 空の場合はDBに保存しない
  validates :content, presence: true

end
