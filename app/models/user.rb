# encoding: utf-8

class User < ActiveRecord::Base
  # User Roles
  rolify

  # Include default devise modules. :omniauthable, :registerable, :confirmable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable, :token_authenticatable
  before_save :reset_authentication_token
  has_many :discussions
  has_many :articles

  acts_as_voter


  def short_name
    if self.privacy
      if self.last_name.present?
        [self.first_name.to_s[0],self.last_name].join(". ")
      else
        self.email
      end
    else
      "Anonym"
    end
  end
end
