class Post < ActiveRecord::Base

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :author, class_name: "AdminUser"

end
