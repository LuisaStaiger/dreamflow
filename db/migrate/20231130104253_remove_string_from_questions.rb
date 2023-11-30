class RemoveStringFromQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_column :questions, :string, :string
  end
end
