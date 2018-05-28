class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :question
      t.integer :evaluation_id
      t.integer :user_id
      t.string :answer
      t.boolean :correct

      t.timestamps
    end
  end
end
