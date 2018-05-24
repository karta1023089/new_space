# == Schema Information
#
# Table name: repair_items
#
#  id          :integer          not null, primary key
#  name        :string
#  content     :text
#  happen_date :date
#  deleted_at  :datetime
#  repair_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RepairItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
