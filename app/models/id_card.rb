# == Schema Information
#
# Table name: id_cards
#
#  id         :integer          not null, primary key
#  name       :string
#  cover      :string
#  content    :text
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class IdCard < ApplicationRecord
	mount_uploader :cover, ImageUploader
end
