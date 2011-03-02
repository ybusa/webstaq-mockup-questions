class RenameQuestionsDataValue < ActiveRecord::Migration
  def self.up
    rename_column :question_options, :dat_value, :data_value
  end

  def self.down
    rename_column :question_options, :data_value, :dat_value
  end
end
