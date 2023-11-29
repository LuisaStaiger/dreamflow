class CreateDreams < ActiveRecord::Migration[7.1]
  def change
    create_table :dreams do |t|
      t.date :date
      t.string :content
      t.string :text
      t.string :recording
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
