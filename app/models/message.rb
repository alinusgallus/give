class Message < ActiveRecord::Base
  belongs_to :item

  validates :sender_id, presence: true
  validates :content, presence: true, length: { maximum: 260 }


end
