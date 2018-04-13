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

class MyAd < ApplicationRecord
	  mount_uploader :file, ::ImageUploader
  enum use_type: {
    index_pic: 0,
    main_ad: 1
  }
end
