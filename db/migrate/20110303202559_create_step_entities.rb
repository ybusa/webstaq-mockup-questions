class CreateStepEntities < ActiveRecord::Migration
  def self.up
    create_table :step_entities do |t|
      t.integer :entity_id
      t.integer :report_step_id
      t.boolean :submitted, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :step_entities
  end
end
