# == Schema Information
# Schema version: 20110303201144
#
# Table name: report_steps
#
#  id          :integer         not null, primary key
#  step_id     :integer
#  submitted   :boolean
#  created_at  :datetime
#  updated_at  :datetime
#  initialized :boolean
#

class ReportStep < ActiveRecord::Base
  attr_accessible :step_id, :submitted

  belongs_to :step
  has_many :step_entities
  has_many :entities, :through => :step_entities


  def initialize_report_step
    unless initialized?
      Entity.all.each do |entity|
        step_entities.find_or_create_by_entity_id(entity.id).save
      end
      toggle!(:initialized)
    end
  end
end
