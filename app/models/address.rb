# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  line1      :string(255)
#  line2      :string(255)
#  city       :string(255)
#  zip        :string(255)
#  state_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Address < ActiveRecord::Base
  belongs_to :state

  def city_state_zip
    "#{self.city}, #{self.state.abbv} #{self.zip}"
  end

  def oneline_summary
    summary = ""
    summary << "#{self.line1}" if self.line1
    if self.line2
      if summary
       summary << ', '
      else
         summary << ' '
      end
      summary << self.line2
    end
    summary << ", #{self.city_state_zip}"
    return summary
  end

end
