class AddDreamQuestionReferenceToDreams < ActiveRecord::Migration[7.1]
  def change
    add_reference :dreams, :dream_question, null: true, foreign_key: true
  end
end
