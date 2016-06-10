class User < ActiveRecord::Base

  has_many :posts
  has_and_belongs_to_many :teams

end
