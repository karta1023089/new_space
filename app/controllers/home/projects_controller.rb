class Home::ProjectsController < HomeController
	 impressionist :actions=> [:show]
	def index
		@category = Category.find(params[:category])
		@projects = Project.where(:category_id => @category.id)
		@the_group = @projects.pluck(:the_group).uniq
	end
	def show
		@project = Project.find(params[:id])
		@category = @project.category
		@sugg = Project.where.not(:id => @project.id).where(:category_id => @project.category.parent.children.pluck(:id)).first(2)
		impressionist(@project)
	end
end
