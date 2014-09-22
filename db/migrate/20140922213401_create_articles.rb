# encoding: utf-8

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :description
      t.integer :user_id
      t.integer :discussion_id

      t.timestamps null: false
    end
  end
end
