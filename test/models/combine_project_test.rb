# == Schema Information
#
# Table name: combine_projects
#
#  id          :integer          not null, primary key
#  tour        :text
#  traffic     :text
#  hotel       :text
#  category_id :integer
#  price1_mark :boolean          default(FALSE)
#  price1      :integer
#  price2_mark :boolean          default(FALSE)
#  price2      :integer
#  price3_mark :boolean          default(FALSE)
#  price3      :integer
#  price4_mark :boolean          default(FALSE)
#  price4      :integer
#  cover       :string
#  image1      :string
#  image2      :string
#  image3      :string
#  day         :integer
#  name        :string
#  content     :text
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CombineProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
