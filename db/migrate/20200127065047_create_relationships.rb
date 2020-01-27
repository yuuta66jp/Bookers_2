class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

    	t.references :user, foreign_key: true
    	# follow_idの参照先テーブルはusersテーブルを設定する
    	t.references :follow, foreign_key: { to_table: :users }

      t.timestamps

      # user_idとfollow_idのペアで重複されるものが保存できないよにする（解除せずに何度もフォローできてしまうのを防ぐ
      t.index [:user_id, :follow_id], unique: true

    end
  end
end
