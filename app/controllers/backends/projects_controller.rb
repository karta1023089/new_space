class Backends::ProjectsController < BackendsController

  add_breadcrumb Project.model_name.human, :backends_articles_path
  before_action :find_project,except: %w(index new create)
  before_action :find_categories
  def index
    # @projects = Project.order_by_created_at_desc
    @projects = Project.all.order("category_id")
    # category_id
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @projects = @projects.where(category_id: @category.id)
    end
    # tag

    # k
    if params[:k].present?
      @projects = @projects.where(
        "(name LIKE :k) OR
        (intro LIKE :k)",
        :k => "%#{params[:k]}%"
        )
    end

    @projects = @projects.page(params[:page])

  end

  def new
    @project = Project.new

    add_breadcrumb "新增", new_backends_project_path
  end

  def create
    @project = Project.new(project_params_permit)
    if @project.valid?
      @project.save!
      flash[:success] = "新增成功."
      @project.save

      redirect_to backends_projects_path
    else
      flash[:error] = @project.errors.full_messages.join('</br>')
      
      render template: "/backends/projects/new"
    end  
  end

  def show
  end

  def nokogiri
    render json: @project.nokogiri
  end

  def edit
    # (0..50).each do |i|
    #   @pp = Project.first
    #   @new_project = Project.new
    #   @new_project.name = @pp.name
    #   @new_project.cover = @pp.cover
    #   @new_project.image1 = @pp.image1
    #   @new_project.image2 = @pp.image2
    #   @new_project.image3 = @pp.image3
    #   @new_project.price = @pp.price
    #   @new_project.intro = @pp.intro
    #   @new_project.content = @pp.content
    #   @new_project.the_group = ["中部","西部", "南部" ,"北部","東部"].sample
    #   @new_project.category_id = Category.where.not(:parent_id => nil).sample.id
    #   @new_project.save
    # end
    add_breadcrumb "編輯", edit_backends_project_path(@project)
  end

  def update
    if @project.update(project_params_permit)
      flash[:success] = "編輯成功."
      
      redirect_back(fallback_location: edit_backends_project_path(@project))
    else
      flash[:error] = @project.errors.full_messages.join('</br>')
      render template: "/backends/projects/edit"
    end
  end

  def event
    if @events.include?(params[:event].to_sym)
      @project.send(params[:event])
      @project.save
    end
    @message = "變更狀態成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_projects_path)
      }
    end  
  end

  def destroy
    @project.destroy

    @message = "刪除成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_projects_path) 
      }
    end  


  end

  private
  def find_categories
    @categories = Category.where(:parent_id => nil)
  end

  def find_project
    @project = Project.find(params[:id])

    add_breadcrumb @project.name
  end  

  def project_params_permit
    params.require(:project).permit(
	  :cover,       
	  :image1,      
	  :image2,     
	  :image3,      
	  :name,       
	  :price, 
    :cost,      
	  :intro,       
	  :content,     
	  :category_id, 
	  :the_group,
    :addon   
    )  
  end
end
