# encoding: utf-8

class Article < ActiveRecord::Base
  resourcify #added bei User Roles
  belongs_to :discussion
  belongs_to :user

end
