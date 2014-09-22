# encoding: utf-8

class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :state

      t.timestamps null: false
    end
  end
end
