# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  name       :string
#  cover      :string
#  image1     :string
#  image2     :string
#  image3     :string
#  image4     :string
#  deleted_at :datetime
#  intro      :text
#  content    :text
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
