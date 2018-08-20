class RemoveUserAvatarFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :user_avatar, :string
  end
end
