class AddUserAvatarToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :user_avatar, :string
  end
end
