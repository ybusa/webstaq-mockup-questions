class AddInitializedToReportSteps < ActiveRecord::Migration
  def self.up
    add_column :report_steps, :initialized, :boolean
  end

  def self.down
    remove_column :report_steps, :initialized
  end
end
