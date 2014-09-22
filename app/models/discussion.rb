# encoding: utf-8

class Discussion < ActiveRecord::Base

  belongs_to :user
  has_many :articles

end
