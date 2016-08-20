class Post < ActiveRecord::Base

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumbnail: "50x50>" }, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/, /JPG?\Z/]

  validates_attachment_size :image, less_than: 4.megabytes

  belongs_to :author, class_name: "AdminUser"

end
