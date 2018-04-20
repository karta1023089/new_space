class Home::BackpackersController < HomeController
	def index
	end
	def show
		@combine = CombineProject.find(params[:id])
		@pro1 = Project.where(:id => @combine.tour)
		@pro2 = Project.where(:id => @combine.traffic)
		@pro3 = Project.where(:id => @combine.hotel)
		impressionist(@combine)
	end
end
