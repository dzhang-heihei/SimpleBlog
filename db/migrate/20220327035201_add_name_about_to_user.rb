# frozen_string_literal: true

class AddNameAboutToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :about, :string
  end
end
