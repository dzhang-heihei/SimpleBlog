# frozen_string_literal: true

class AddStateToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :state, :integer, null: false, default: 0
  end
end
