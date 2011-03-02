class CreateQuestionOptions < ActiveRecord::Migration
  def self.up
    create_table :question_options do |t|
      t.integer :question_id
      t.string :display_value
      t.string :dat_value

      t.timestamps
    end
  end

  def self.down
    drop_table :question_options
  end
end
