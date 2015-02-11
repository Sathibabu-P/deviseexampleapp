class Post < ActiveRecord::Base
  has_many :post_images, dependent: :destroy
  #accepts_nested_attributes_for :post_images, :reject_if => lambda { |t| t['post_image'].nil? }
  belongs_to :author, polymorphic: true
end
