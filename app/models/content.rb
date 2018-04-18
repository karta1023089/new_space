# == Schema Information
#
# Table name: contents
#
#  id         :integer          not null, primary key
#  cover      :string
#  name       :string
#  show_date  :date
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#

class Content < ApplicationRecord
	mount_uploader :cover, ::ImageUploader
end
