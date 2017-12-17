class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :author
  has_one :commenter
  has_many :conversations, :foreign_key => :sender_id

  acts_as_votable

  attr_accessor :login

validates :username, presence: true, uniqueness: {case_sensitive: false}
validates :formation, presence: true
validates :niveau, presence: true
validates :fac, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   devise :omniauthable, omniauth_providers: [:facebook]

    def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
        where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: login.downcase).first
    else
        where(conditions.to_hash).first
    end
end



def self.from_facebook(auth)
  where(facebook_id: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.username = auth.info.name
    user.password = Devise.friendly_token[0,20]
    user.skip_confirmation!
  end
end

 private

  # for demo purposes

  def create_default_conversation
    Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
  end

mount_uploader :image, ImageUploader

end

