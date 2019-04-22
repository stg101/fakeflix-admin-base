class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_create :add_regular_role
  
  has_many :providers 
  has_many :assignments  
  has_many :roles, through: :assignments 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook github twitter]

  def role?(role)  
    roles.any? { |r| r.name.underscore.to_sym == role }  
  end 

  def add_regular_role
    unless roles.any?
      roles << Role.create(name: "regular")
    end    
  end

  def self.from_omniauth(auth)
    user = where(email: auth.info.email.downcase).first_or_create do |user|
      user.email = auth.info.email.downcase
      user.password = Devise.friendly_token[0, 20]
    end
    provider = Provider.find_or_create_by(name: auth.provider, uid: auth.uid, user_id: user.id)
    user
  end
end
