# == Schema Information
#
# Table name: id_cards
#
#  id         :integer          not null, primary key
#  name       :string
#  cover      :string
#  content    :text
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  make_day   :integer
#  the_group  :string
#

require 'test_helper'

class IdCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
