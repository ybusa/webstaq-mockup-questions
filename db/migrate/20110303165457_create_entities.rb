class CreateEntities < ActiveRecord::Migration
  def self.up
    create_table :entities do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end

  def self.down
    drop_table :entities
  end
end
