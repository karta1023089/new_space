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
#  article1   :text
#  article2   :text
#  article3   :text
#  article4   :text
#  article5   :text
#  article6   :text
#  the_group  :string
#  go_date    :date
#  backe_date :date
#  url        :string
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
