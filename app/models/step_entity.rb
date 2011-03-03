# == Schema Information
# Schema version: 20110303202559
#
# Table name: step_entities
#
#  id             :integer         not null, primary key
#  entity_id      :integer
#  report_step_id :integer
#  submitted      :boolean
#  created_at     :datetime
#  updated_at     :datetime
#

class StepEntity < ActiveRecord::Base
  attr_accessible :entity_id, :report_step_id, :submitted

  belongs_to :entity
  belongs_to :report_step

  validates :entity_id, :presence => true
  validates :report_step_id, :presence => true
  validates :submitted, :inclusion => [true, false]
end
