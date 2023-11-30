class RemoveTextFromQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_column :questions, :text, :text
  end
end
