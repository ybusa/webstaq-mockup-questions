# == Schema Information
# Schema version: 20110302190124
#
# Table name: questions
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  interrogative :string(255)
#  data_type     :string(255)
#  type          :string(255)
#  display_order :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Question < ActiveRecord::Base

  attr_accessible :name, :interrogative, :data_type, :type, :display_order

  def self.available_sub_classes
    [RadioQuestion, SelectQuestion, InputQuestion]
  end

  def self.valid_data_types
    ['int', 'string', 'decimal', 'date']
  end

  def self.valid_types
    self.available_sub_classes.map { |c| c.name }
  end

  def self.type_select_options
    self.available_sub_classes.map { |c| [c.type_name, c.name] }
  end

  validates :name, :presence => true
  validates :interrogative, :presence => true
  validates :data_type, :presence => true, :inclusion => self.valid_data_types
  validates :type, :presence => true
  validates :display_order, :presence => true

  def to_s
    name
  end

  # Override each child class's model_name method so that all question
  # subclasses use the paths for Question.
  def self.inherited(child)
    child.instance_eval do
      def model_name
        Question.model_name
      end
    end
    super
  end

  protected

  def self.type_name
    self.name.humanize
  end

end
