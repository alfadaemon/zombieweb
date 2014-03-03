class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.string :answer
      t.boolean :correct

      t.timestamps
    end
  end
end
