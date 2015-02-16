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
	has_attached_file :upload
	 include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end
end
