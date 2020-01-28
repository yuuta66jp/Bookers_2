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

  has_many :relationships
  # source: :followにてrelationshipsテーブルのfollow_idを参考にしてfollowingsモデルにアクセス
  has_many :followings, through: :relationships, source: :follow
  # foreign_key: 'follow_id'にてfollow_idを入り口としてrelaitionshipsテーブルにアクセスする（入り口）
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  # source: :userで出口をuser_idにする。userテーブルから自分をフォローしているuserを取ってくる
  has_many :followers, through: :reverse_of_relationships, source: :user


  #validation使用
  validates :name, presence:true, length: {in: 2..20}
  validates :introduction, length: { maximum: 50 }

  # userモデルにフォロー機能のメソッドを記載
  def follow(other_user)
    # フォローしようとしているother_userが自分自身ではないか検証
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

# フォローがあればアンフォローを行う
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    # self.followwingsによりフォローしているUser達を取得。include?(other_user)によりother_userが含まれていないか確認
    self.followings.include?(other_user)
  end

end
