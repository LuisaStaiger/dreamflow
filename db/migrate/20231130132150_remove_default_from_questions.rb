class RemoveDefaultFromQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_column :questions, :default, :string
  end
end
