class HomeController < ApplicationController
	def index
		@slide = GroupImage.find(1)
		@ads = MyAd.main_ad
		@cover = MyAd.index_pic
	end
end
