# == Schema Information
# Schema version: 20110304164206
#
# Table name: answers
#
#  id             :integer         not null, primary key
#  entity_id      :integer
#  question_id    :integer
#  not_applicable :boolean
#  data           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Answer < ActiveRecord::Base
  attr_accessible :entity_id, :question_id, :not_applbicable, :data

  belongs_to :entity
  belongs_to :question

  validates :entity_id, :presence => true
  validates :question_id, :presence => true
  validates :not_applicable, :inclusion => [true, false]
  validate :data_validation

  private

  def data_validation
    errors.add(:data, "#{question} cannot be blank") if data.nil? && !not_applicable
  end
  
end
