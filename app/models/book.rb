class Book < ApplicationRecord

  # userモデルに従属する
	belongs_to :user

  # 各modelとの関連付け（アソシエーション）複数形
	has_many :book_comments, dependent: :destroy
	# 1件のbookに対して複数のいいねの関係
	has_many :favorites, dependent: :destroy



	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

  # validation設定
	validates :title, presence: true
	validates :body, presence: true, length: { maximum: 199 }

end
