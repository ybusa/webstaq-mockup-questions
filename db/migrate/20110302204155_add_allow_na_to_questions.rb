class AddAllowNaToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :allow_na, :boolean
  end

  def self.down
    remove_column :questions, :allow_na, :boolean
  end
end
