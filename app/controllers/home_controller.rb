class HomeController < ApplicationController
	before_action :all_cat 
	def index
		@slide = GroupImage.find(1)
		@ads = MyAd.main_ad
		@cover = MyAd.index_pic	
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
	end
end
