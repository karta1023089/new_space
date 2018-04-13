# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  item_type  :string
#  item_id    :integer
#  file       :string
#  priority   :integer          default(0)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  use_way    :integer          default("normal")
#  name       :string
#  url        :string
#  image_alt  :string
#

class Image < ApplicationRecord
  mount_uploader :file, ::ImageUploader
  belongs_to :item, :polymorphic => true
    enum use_way: {
    normal: 0,
    main_ad: 1
  }
end
