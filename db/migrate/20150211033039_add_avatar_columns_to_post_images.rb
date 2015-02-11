class AddAvatarColumnsToPostImages < ActiveRecord::Migration
  def self.up
    add_attachment :post_images, :avatar
  end

  def self.down
    remove_attachment :post_images, :avatar
  end
end
