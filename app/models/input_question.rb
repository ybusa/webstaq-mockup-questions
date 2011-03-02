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

class InputQuestion < Question

	protected

	def self.type_name
		"Input"
	end
end
