# == Schema Information
#
# Table name: systems
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  keywords    :string
#  name        :string
#  email       :string
#  phone       :string
#  address     :string
#  socials     :text
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  youtube     :text
#

require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
