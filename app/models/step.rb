# == Schema Information
# Schema version: 20110303174946
#
# Table name: steps
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Step < ActiveRecord::Base
  attr_accessible :name, :question_ids

  validates :name, :presence => true

  has_many :step_questions
  has_many :questions, :through => :step_questions

  def to_s
    name
  end
end
