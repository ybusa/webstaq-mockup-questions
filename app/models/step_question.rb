# == Schema Information
# Schema version: 20110303191902
#
# Table name: step_questions
#
#  id          :integer         not null, primary key
#  question_id :integer
#  step_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class StepQuestion < ActiveRecord::Base
  attr_accessible :question_id, :step_id

  belongs_to :question
  belongs_to :step
end
