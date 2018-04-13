# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  cover       :string
#  image1      :string
#  image2      :string
#  image4      :string
#  name        :string
#  price       :integer
#  intro       :text
#  content     :text
#  deleted_at  :datetime
#  category_id :integer
#  the_group   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
