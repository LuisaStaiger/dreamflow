class AddQuestionTextToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :question_text, :string
  end
end
