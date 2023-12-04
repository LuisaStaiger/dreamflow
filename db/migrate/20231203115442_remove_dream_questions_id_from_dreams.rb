class RemoveDreamQuestionsIdFromDreams < ActiveRecord::Migration[7.1]
  def change
    remove_column :dreams, :dream_question_id, :integer

    add_reference :dream_questions, :dream, foreign_key: true
    remove_column :dream_questions, :answer_id, :integer

    remove_column :questions, :answer, :text

    add_reference :answers, :dream_question, foreign_key: true
  end
end
