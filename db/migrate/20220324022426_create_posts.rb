#frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def up
    return if ActiveRecord::Base.connection.table_exists? 'posts'
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end

  def down
    return unless ActiveRecord::Base.connection.table_exists? 'posts'

    drop_table :posts
  end
end
