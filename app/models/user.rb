# encoding: utf-8

class User < ActiveRecord::Base
  # User Roles
  rolify

  # Include default devise modules. :omniauthable,
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable, :confirmable

  has_many :discussions
  has_many :articles


  def short_name
    if self.last_name.present?
      [self.first_name.to_s[0],self.last_name].join(". ")
    else
      self.email
    end
  end
end
