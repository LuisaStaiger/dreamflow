class AddDefaultToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :default, :boolean
  end
end
