# encoding: utf-8

class User < ActiveRecord::Base
  # Include default devise modules. :omniauthable,
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable, :confirmable
end
