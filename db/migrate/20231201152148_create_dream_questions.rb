class CreateDreamQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :dream_questions do |t|
      t.references :answer, null: true, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
