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
#

class Project < ApplicationRecord
	mount_uploader :cover, ImageUploader
	mount_uploader :image1, ImageUploader
	mount_uploader :image2, ImageUploader
	mount_uploader :image3, ImageUploader
	belongs_to :category
	is_impressionable
end
