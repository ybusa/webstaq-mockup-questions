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
  has_many :entity_steps
  has_many :entities, :through => :entity_steps


end
