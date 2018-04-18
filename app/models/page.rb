# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string
#  content    :text
#  deleted_at :datetime
#  intro      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ApplicationRecord
end
