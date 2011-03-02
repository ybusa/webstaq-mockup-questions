class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :name
      t.string :interrogative
      t.string :data_type
      t.string :type
      t.integer :display_order
      t.string :data_type

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
