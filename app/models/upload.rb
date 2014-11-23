# encoding: utf-8

class Upload < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x150#",:thumb => "100x100>" }

  validates_attachment  :image,
                        :presence => true,
                        :content_type => { :content_type => /^image.*/ },
                        :size => { :less_than => 30.megabyte }
end
