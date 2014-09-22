# encoding: utf-8

class Article < ActiveRecord::Base

  belongs_to :discussion
  belongs_to :user

end
