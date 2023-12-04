class AddOriginalToQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_column :questions, :correct, :boolean
    add_column :questions, :original, :boolean
  end
end
