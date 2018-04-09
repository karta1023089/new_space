class Home::NewsController < HomeController
	def index
		@contents = Content.order_by_created_at_desc.first(7)
	end
	def show
		@content = Content.find(params[:id])
    end
end
