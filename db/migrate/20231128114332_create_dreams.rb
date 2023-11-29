class CreateDreams < ActiveRecord::Migration[7.1]
  def change
    create_table :dreams do |t|
      t.date :date
      t.text :content
      t.string :recording
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
