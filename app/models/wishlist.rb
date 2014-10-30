class Wishlist < ActiveRecord::Base
	belongs_to :user
	belongs_to :wlitem, class_name: "Item", foreign_key: :id
end