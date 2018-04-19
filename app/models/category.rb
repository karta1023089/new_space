# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  name          :string
#  category_type :integer
#  parent_id     :integer
#  priority      :integer
#  deleted_at    :datetime
#  open_mark     :boolean
#  cover_image   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Category < ApplicationRecord	  
  #include Imageable 
  mount_uploader :cover_image, ImageUploader
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'
  has_many :projects
  has_many :combine_projects
  scope :open,-> {where(open_mark: true)}
  enum category_type:{
    origin: 0,
  }

   #validates_uniqueness_of :name ,scope: :category_type, :scope => :deleted_at
   #validates_uniqueness_of :name, conditions: -> {without_deleted}
   #validates_uniqueness_of
end
