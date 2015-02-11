# class PostImage < ActiveRecord::Base
# 	belongs_to :post
# 	has_attached_file :avatar,:styles => { :medium => "300x300>" },
#     :path => ":rails_root/public/images/:id/:filename",
#     :url  => "/images/:id/:filename"

#   do_not_validate_attachment_file_type :avatar
# end
class PostImage < ActiveRecord::Base
	belongs_to :post
	#has_attached_file :avatar,:styles => { :medium => "300x300>" }    
	has_attached_file :avatar, :styles => 
           { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_content_type :avatar, :content_type => /^image\/(bmp|gif|jpg|jpeg|png)/
  #do_not_validate_attachment_file_type :avatar
end
