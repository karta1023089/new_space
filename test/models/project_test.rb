# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  cover       :string
#  image1      :string
#  image2      :string
#  image3      :string
#  name        :string
#  price       :integer
#  intro       :text
#  content     :text
#  deleted_at  :datetime
#  category_id :integer
#  the_group   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cost        :integer
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
