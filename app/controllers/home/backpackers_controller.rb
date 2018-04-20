class Home::BackpackersController < HomeController
	def index
		@the_category = Category.find(params[:category])
		@combines = @the_category.combine_projects
		@the_group = @combines.pluck(:the_group).uniq
	end
	def show
		@combine = CombineProject.find(params[:id])
		@pro1 = Project.where(:id => @combine.tour)
		@pro2 = Project.where(:id => @combine.traffic)
		@pro3 = Project.where(:id => @combine.hotel)
		impressionist(@combine)
	end
end
