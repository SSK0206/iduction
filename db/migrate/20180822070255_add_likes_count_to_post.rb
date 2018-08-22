class AddLikesCountToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :likes_count, :integer
  end
end
