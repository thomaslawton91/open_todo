class User < ApplicationRecord
  has_many :lists, dependent: :destroy

  validates_presence_of :username, :email, :password

  before_create do |user|
    user.api_key = user.generate_api_key
  end

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end  
end
