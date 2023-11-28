class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :text
      t.string :default
      t.string :string
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
