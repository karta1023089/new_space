class Backends::PagesController < BackendsController

  add_breadcrumb Page.model_name.human, :backends_pages_path
  before_action :find_page,except: %w(index new create)
  def index
    @pages = Page.order_by_created_at_desc

    @pages = @pages.page(params[:page])

  end

  def new
    @page = Page.new

    add_breadcrumb "新增", new_backends_page_path
  end

  def create
    @page = Page.new(page_params_permit)
    if @page.valid?
      @page.save!
      flash[:success] = "新增成功."
      @page.save

      redirect_to backends_pages_path
    else
      flash[:error] = @page.errors.full_messages.join('</br>')
      
      render template: "/backends/pages/new"
    end  
  end

  def show
  end

  def nokogiri
    render json: @page.nokogiri
  end

  def edit
    add_breadcrumb "編輯", edit_backends_page_path(@page)
  end

  def update
    if @page.update(page_params_permit)
      flash[:success] = "編輯成功."
      
      redirect_back(fallback_location: edit_backends_page_path(@page))
    else
      flash[:error] = @page.errors.full_messages.join('</br>')
      render template: "/backends/pages/edit"
    end
  end

  def event
    if @events.include?(params[:event].to_sym)
      @page.send(params[:event])
      @page.save
    end
    @message = "變更狀態成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_pages_path)
      }
    end  
  end

  def destroy
    @page.destroy

    @message = "刪除成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_pages_path) 
      }
    end  


  end

  private

  def find_page
    @page = Page.find(params[:id])

    add_breadcrumb @page.name
  end  

  def page_params_permit
    params.require(:page).permit(            
	  :name,                    
	  :content,      
    )  
  end
end
