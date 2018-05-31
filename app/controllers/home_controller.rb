class HomeController < ApplicationController
	before_action :all_cat 
	def index
		@slide = GroupImage.find(1)
		@ads = MyAd.main_ad
		@cover = MyAd.index_pic	
		@projects = Project.all.sample(6)
	end
	def about
		@content = Page.find(1)
	end
	def doc
		@id_cards = IdCard.all
	end
	private
	def all_cat
		@categories = Category.where(:parent_id => nil)
		@cat1 = @categories.first(2)
		@cat2 = @categories.where(:id => [3,14])
		@cat3 = @categories.where(:id => [15,16])
	end
end
