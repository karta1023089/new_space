# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  content    :text
#  deleted_at :datetime
#  status     :integer
#  reply_mark :boolean
#  reply      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
end
