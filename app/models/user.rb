class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/
  before_validation :check_password
  has_one :cart
  has_many :cart_items, :through => :cart


  private
  
  def check_password
    self.password = '1234' unless password
  end
end
