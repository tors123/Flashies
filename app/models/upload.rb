class Upload < ActiveRecord::Base
  belongs_to :flashcard
  
  has_attached_file :upload
  validates_attachment_presence :upload
  validates_attachment_content_type :upload, :content_type => ["image/gif", "image/jpg", "image/jpeg", "image/png", "image/bmp",
      "application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document" ]
end
