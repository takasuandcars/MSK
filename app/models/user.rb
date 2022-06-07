class User < ApplicationRecord
  # validates :email, uniqueness: {case_sensitive: true}
  has_many :work_times
  before_create :qrno
  has_secure_password # bcryptの機能 attributeでpassword, passowrd_confirmationが自動生成, DBにはpassowrd_digestを作る必要がある
  validates :password, presence: true, length: { minimum: 4 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :entries
  has_many :direct_messages
  has_many :rooms, through: :entries

  def qrno
    self.qrcode = 7.times.map { SecureRandom.random_number(10) }.join.to_i
  end
end
