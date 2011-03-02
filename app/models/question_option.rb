# == Schema Information
# Schema version: 20110302211412
#
# Table name: question_options
#
#  id            :integer         not null, primary key
#  question_id   :integer
#  display_value :string(255)
#  data_value    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class QuestionOption < ActiveRecord::Base
  attr_accessible :question_id, :display_value, :data_value
  belongs_to :question
end
