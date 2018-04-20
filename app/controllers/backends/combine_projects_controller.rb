class Backends::CombineProjectsController < BackendsController
  
  add_breadcrumb CombineProject.model_name.human, :backends_articles_path
  before_action :find_combine_project,except: %w(index new create)
  before_action :find_categories
  def index
    # @projects = Project.order_by_created_at_desc
    @the_category = Category.find(params[:category_id])
    @combine_projects = @the_category.combine_projects.order("category_id")

    @combine_projects = @combine_projects.page(params[:page])

  end

  def new
    @combine_project = CombineProject.new
    @the_category = Category.find(params[:category_id])

    add_breadcrumb "新增", new_backends_combine_project_path
  end

  def create

    @combine_project = CombineProject.new(combine_project_params_permit)
    if @combine_project.valid?
      @combine_project.save!
      flash[:success] = "新增成功."
      @combine_project.save

      redirect_to backends_combine_projects_path(:category_id => @combine_project.category_id)
    else
      flash[:error] = @combine_project.errors.full_messages.join('</br>')
      
      render template: "/backends/combine_projects/new"
    end  
  end

  def show
  end

  def nokogiri
    render json: @combine_project.nokogiri
  end

  def edit
    @the_category = @combine_project.category
    add_breadcrumb "編輯", edit_backends_combine_project_path(@combine_project)
  end

  def update
    if @combine_project.update(combine_project_params_permit)
      flash[:success] = "編輯成功."
      
      redirect_back(fallback_location: edit_backends_combine_project_path(@combine_project))
    else
      flash[:error] = @combine_project.errors.full_messages.join('</br>')
      render template: "/backends/combine_projects/edit"
    end
  end

  def event
    if @events.include?(params[:event].to_sym)
      @combine_project.send(params[:event])
      @combine_project.save
    end
    @message = "變更狀態成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_combine_projects_path)
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
        redirect_back(fallback_location: backends_combine_projects_path) 
      }
    end  


  end

  private
  def find_categories
    @categories = Category.where(:parent_id => nil)
  end

  def find_combine_project
    @combine_project = CombineProject.find(params[:id])

    add_breadcrumb @combine_project.name
  end  

  def combine_project_params_permit
    params.require(:combine_project).permit(
    :cover,       
    :image1,      
    :image2,     
    :image3,      
    :name,       
    :price1_mark,
    :price2_mark,
    :price3_mark,
    :price4_mark,
    :price1,
    :price2,
    :price3,
    :price4,    
    :intro,       
    :content,     
    :category_id, 
    tour: [],
    traffic: [],
    hotel: []
   
    )  
  end
end
