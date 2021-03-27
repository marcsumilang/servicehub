class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2] 

  def self.from_omniauth(auth)
    # user = User.where(email: auth.info.email).first
    # name_split = auth.info.name.split(" ")
    user = User.find_by(email: auth.info.email)
    if user
      user.provider = auth.provider
      user.name = auth.info.name
      user.photo_url = URI.parse(auth.info.image)
      user.uid = auth.uid
      user.save
    else
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.photo_url = URI.parse(auth.info.image)
        user.password = Devise.friendly_token[0,20]
      end
    end
    user
  end  

  def self.create_from_google_data(auth)
    # user = User.where(email: auth.info.email).first
    # name_split = auth.info.name.split(" ")
    user = User.find_by(email: auth.info.email)
    if user
      user.provider = auth.provider
      user.name = auth.info.name
      user.photo_url = URI.parse(auth.info.image)
      user.uid = auth.uid
      user.save
    else
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.photo_url = URI.parse(auth.info.image)
        user.password = Devise.friendly_token[0,20]
      end
    end
    user
  end  
  
end
