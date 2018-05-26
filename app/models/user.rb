class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  validates :rut, presence: :true, uniqueness: { case_sensitive: false }

  attr_accessor :rut
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, authentication_keys: [:rut]

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:rut)
        where(conditions.to_h).where(["lower(rut) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:rut) || conditions.has_key?(:email)
      	where(conditions.to_h).first
      end
    end


  end
