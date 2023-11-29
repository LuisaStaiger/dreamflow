class CreateDreamLabels < ActiveRecord::Migration[7.1]
  def change
    create_table :dream_labels do |t|
      t.references :dream, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
