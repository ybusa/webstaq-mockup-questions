# == Schema Information
# Schema version: 20110303165457
#
# Table name: entities
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Entity < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  has_many :entity_steps
  has_many :report_steps, :through => :step_entities
  has_many :answers

  accepts_nested_attributes_for :answers

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    full_name
  end
end
