class AddExplanationTextToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :explanation_text, :text
  end
end
