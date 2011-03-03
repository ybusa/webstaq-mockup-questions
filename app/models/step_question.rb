class StepQuestion < ActiveRecord::Base
  attr_accessible :question_id, :step_id

  belongs_to :question
  belongs_to :step
end
