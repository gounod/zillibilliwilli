# encoding: utf-8

class AddPrivacyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :privacy, :boolean, :default => false
  end
end
