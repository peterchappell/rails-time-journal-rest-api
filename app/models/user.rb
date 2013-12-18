class User < ActiveRecord::Base

  validates_presence_of   :email, on: :create
  validates_uniqueness_of :email, on: :create
  validates_presence_of   :password,      on: :create

  has_many :entries
  has_many :activities
  has_many :days

  def password=(secret)
    write_attribute(:password, BCrypt::Password.create(secret))
  end

  private

  def _set_defaults
    self.api_secret ||= MicroToken.generate(128)
  end

end
