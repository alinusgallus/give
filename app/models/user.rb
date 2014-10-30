class User < ActiveRecord::Base
has_many :items, dependent: :destroy

has_many :wishlists
has_many :wlitems, through: :wishlists


  before_save { email.downcase! }
  before_create :create_remember_token

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
	

  has_secure_password

  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def likes?(item)
    self.wlitems.any?{|wishlist_item| wishlist_item.id==item.id} 
  end

  def like(item)
    wishlists.create!(item.id)
  end

  def unlke(item)
    wishlists.find_by(item.id).destroy
  end


  private

  def create_remember_token
  	self.remember_token = User.hash(User.new_remember_token)
  end
end
