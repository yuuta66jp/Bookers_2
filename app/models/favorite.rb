class Favorite < ApplicationRecord

	# user,bookモデルに従属する
	belongs_to :user
	belongs_to :book

end
