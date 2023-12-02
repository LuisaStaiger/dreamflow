class AddAnswerToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :answer, :text
  end
end
