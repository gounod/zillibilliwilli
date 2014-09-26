# encoding: utf-8

class Article < ActiveRecord::Base
  resourcify #added bei User Roles
  belongs_to :discussion
  belongs_to :user

  after_create :send_notifications
  acts_as_votable

  def send_notifications
    #mail an Moderator, wenn er das will
    if self.user.notify_me_on_new_articles_i_moderate
      Mailer.new_article(self.user,self).deliver
    end

    # User.where(:notify_me_on_new_articles_i_follow => true).each do |user|
    #   Mailer.new_article(user,self).deliver
    # end
  end

end
