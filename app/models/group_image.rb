# == Schema Information
#
# Table name: group_images
#
#  id         :integer          not null, primary key
#  remark     :string
#  width      :string
#  height     :string
#  deleted_at :datetime
#  group_type :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class GroupImage < ApplicationRecord
  has_many :images, :as => :item
  has_one :image, :as => :item
  accepts_nested_attributes_for :images, allow_destroy: true

  enum group_type: {
    slideshow: 0,
  }
end
