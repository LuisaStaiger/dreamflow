class AddTitleToDreams < ActiveRecord::Migration[7.1]
  def change
    add_column :dreams, :title, :string
  end
end
