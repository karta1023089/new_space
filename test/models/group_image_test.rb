# == Schema Information
#
# Table name: group_images
#
#  id         :integer          not null, primary key
#  remark     :string
#  width      :string
#  height     :string
#  deleted_at :datetime
#  group_type :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

require 'test_helper'

class GroupImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
