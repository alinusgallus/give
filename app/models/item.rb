class Item < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :messages

	has_attached_file :item_pic, :styles => { :medium => "300x300", :thumb => "100x100"},:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :item_pic, :content_type => /\Aimage\/.*\Z/

	validates :name, presence: true, length: { maximum: 140 }
	validates :description, presence: true, length: { maximum: 140 }



end
