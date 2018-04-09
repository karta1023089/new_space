# == Schema Information
#
# Table name: contents
#
#  id         :integer          not null, primary key
#  cover      :string
#  name       :string
#  show_date  :date
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
