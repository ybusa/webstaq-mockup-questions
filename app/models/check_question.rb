# == Schema Information
# Schema version: 20110303165457
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

class CheckQuestion < Question

  protected
  
  def self.type_name
    "Check Box"
  end
end
