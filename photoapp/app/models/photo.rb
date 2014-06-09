class Photo < ActiveRecord::Base
  attr_accessible :caption, :image, :title, :collection_id, :user_id
  belongs_to :user, :class_name=> "User", :foreign_key => "user_id"
  belongs_to :collection, :class_name=> "Collection", :foreign_key => "collection_id"
  has_many :comments
end
