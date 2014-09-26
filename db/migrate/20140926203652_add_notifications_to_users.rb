# encoding: utf-8

class AddNotificationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notify_me_on_discussion_create, :boolean, :default => false
    add_column :users, :notify_me_on_new_articles_i_follow, :boolean, :default => false
    add_column :users, :notify_me_on_new_articles_i_moderate, :boolean, :default => false
  end
end
