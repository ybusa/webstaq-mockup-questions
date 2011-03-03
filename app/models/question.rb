# == Schema Information
# Schema version: 20110302204155
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
#  allow_na      :boolean
#

class Question < ActiveRecord::Base

  attr_accessible :name, :interrogative, :data_type, :type, :display_order, :allow_na, :question_options_attributes

  has_many :question_options, :dependent => :destroy

  accepts_nested_attributes_for :question_options, :reject_if => lambda { |a| a[:display_value].blank? }, :allow_destroy => true

  def self.available_sub_classes
    [RadioQuestion, SelectQuestion, InputQuestion, CheckQuestion]
  end

  def self.valid_data_types
    ['int', 'string', 'decimal', 'date','boolean']
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
  validates :allow_na, :inclusion => [true, false]

  def to_s
    name
  end

  def select_options
    options = question_options.map { |opt| [opt.display_value, opt.data_value] }
    options += [["N/A", "N/A"]] if allow_na
    options
  end

  # Override each child class's model_name method so that all question
  # subclasses use the paths for Question.
  #def self.inherited(child)
  #  child.instance_eval do
  #    def model_name
  #      Question.model_name
  #    end
  #  end
  #  super
  #end

  protected

  def self.type_name
    self.name
  end

end
