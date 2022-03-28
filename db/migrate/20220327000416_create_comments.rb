#frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def up
    return if ActiveRecord::Base.connection.table_exists? 'comments'
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.timestamps
    end
  end

  def down
    return unless ActiveRecord::Base.connection.table_exists? 'comments'

    drop_table :comments
  end
end
