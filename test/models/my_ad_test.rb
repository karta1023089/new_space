# == Schema Information
#
# Table name: my_ads
#
#  id         :integer          not null, primary key
#  file       :string
#  priority   :integer
#  deleted_at :datetime
#  name       :string
#  url        :string
#  image_alt  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  use_type   :integer          default("index_pic")
#

require 'test_helper'

class MyAdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
