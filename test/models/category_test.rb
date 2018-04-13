# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  name          :string
#  category_type :integer
#  parent_id     :integer
#  priority      :integer
#  deleted_at    :datetime
#  open_mark     :boolean
#  cover_image   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
