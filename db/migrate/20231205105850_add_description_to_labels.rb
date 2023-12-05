class AddDescriptionToLabels < ActiveRecord::Migration[7.1]
  def change
    add_column :labels, :description, :string
  end
end
