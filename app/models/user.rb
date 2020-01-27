class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
　# 画像
  attachment :profile_image

  # 各modelとの関連付け(アソシエーション)、所有数が一つとは限らないので複数形、destroyで関連付け削除
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

　#validation使用
  validates :name, presence:true, length: {in: 2..20}
  validates :introduction, length: { maximum: 50 }

end
