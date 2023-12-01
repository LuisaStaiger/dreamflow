class MakeChangesToDb < ActiveRecord::Migration[7.1]
  def change
    remove_column :labels,:string, :string
    remove_column :questions, :default, :boolean
    add_column :questions, :correct, :boolean
    add_column :users, :username, :string
    add_column :users, :current_goal, :string
    add_column :users, :current_dreams, :string
    add_column :users, :current_influences, :string
  end
end
