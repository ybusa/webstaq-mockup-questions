class CreateReportSteps < ActiveRecord::Migration
  def self.up
    create_table :report_steps do |t|
      t.integer :step_id
      t.boolean :submitted

      t.timestamps
    end
  end

  def self.down
    drop_table :report_steps
  end
end
