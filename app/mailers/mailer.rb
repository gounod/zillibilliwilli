# encoding: utf-8

class Mailer < ActionMailer::Base
  default from: "weg@gounod.berlin"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.login.subject
  #
  def login(user)
    @user = user
    @greeting = "Hallo #{user.short_name}"
    mail to: user.email
  end

  def new_discussion(user, discussion)
    @user = user
    @greeting = "Hallo #{user.short_name}"
    @discussion = discussion
    mail to: user.email, :subject => "Neues Thema: #{discussion.title}"
  end

  def new_article(user, article)
    @user = user
    @greeting = "Hallo #{user.short_name}"
    @article = article
    mail to: user.email, :subject => "Neuer Beitrag: #{article.try(:discussion).try(:title)}"
  end

end
