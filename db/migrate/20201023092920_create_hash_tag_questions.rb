class CreateHashTagQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :hash_tag_questions do |t|
      t.references :hash_tag, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
