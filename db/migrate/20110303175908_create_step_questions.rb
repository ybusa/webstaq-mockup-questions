class CreateStepQuestions < ActiveRecord::Migration
  def self.up
    create_table :step_questions do |t|
      t.integer :question_id
      t.integer :step_id 

      t.timestamps
    end
  end

  def self.down
    drop_table :step_questions
  end
end
