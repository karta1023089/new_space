class Backends::ContentsController < BackendsController

  add_breadcrumb Content.model_name.human, :backends_articles_path
  before_action :find_content,except: %w(index new create)
  def index
    @contents = Content.order_by_created_at_desc
    # k
    if params[:k].present?
      @contents = @contents.where(
        "(name LIKE :k) OR
        (content LIKE :k)",
        :k => "%#{params[:k]}%"
        )
    end
    @contents = @contents.page(params[:page])

  end

  def new
    @content = Content.new

    add_breadcrumb "新增", new_backends_content_path
  end

  def create
    @content = Content.new(content_params_permit)
    if @content.valid?
      @content.save!
      flash[:success] = "新增成功."
      @content.save

      redirect_to backends_contents_path
    else
      flash[:error] = @content.errors.full_messages.join('</br>')
      
      render template: "/backends/contents/new"
    end  
  end

  def show
  end

  def nokogiri
    render json: @content.nokogiri
  end

  def edit
    add_breadcrumb "編輯", edit_backends_content_path(@content)
  end

  def update
    if @content.update(content_params_permit)
      flash[:success] = "編輯成功."
      
      redirect_back(fallback_location: edit_backends_content_path(@content))
    else
      flash[:error] = @content.errors.full_messages.join('</br>')
      render template: "/backends/contents/edit"
    end
  end

  def event
    if @events.include?(params[:event].to_sym)
      @content.send(params[:event])
      @content.save
    end
    @message = "變更狀態成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_contents_path)
      }
    end  
  end

  def destroy
    @content.destroy

    @message = "刪除成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_contents_path) 
      }
    end  


  end

  private

  def find_content
    @content = Content.find(params[:id])

    add_breadcrumb @content.name
  end  

  def content_params_permit
    params.require(:content).permit(
	  :cover,             
	  :name,       
	  :show_date,             
	  :content,      
    )  
  end
end
