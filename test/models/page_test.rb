# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string
#  content    :text
#  deleted_at :datetime
#  intro      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
