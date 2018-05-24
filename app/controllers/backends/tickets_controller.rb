class Backends::TicketsController < BackendsController

  add_breadcrumb Ticket.model_name.human, :backends_tickets_path
  before_action :find_ticket,except: %w(index new create)
  def index
    # @projects = Project.order_by_created_at_desc
    @tickets = Ticket.all
    # tag

    # k
    if params[:k].present?
      @tickets = @tickets.where(
        "(name LIKE :k) OR
        (intro LIKE :k)",
        :k => "%#{params[:k]}%"
        )
    end

    @tickets = @tickets.page(params[:page])

  end

  def new
    @ticket = Ticket.new

    add_breadcrumb "新增", new_backends_ticket_path
  end

  def create
    @ticket = Ticket.new(ticket_params_permit)
    if @ticket.valid?
      @ticket.save!
      flash[:success] = "新增成功."
      @ticket.save

      redirect_to backends_tickets_path
    else
      flash[:error] = @ticket.errors.full_messages.join('</br>')
      
      render template: "/backends/tickets/new"
    end  
  end

  def show
  end

  def nokogiri
    render json: @ticket.nokogiri
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
    add_breadcrumb "編輯", edit_backends_ticket_path(@ticket)
  end

  def update
    if @ticket.update(ticket_params_permit)
      flash[:success] = "編輯成功."
      
      redirect_back(fallback_location: edit_backends_ticket_path(@ticket))
    else
      flash[:error] = @ticket.errors.full_messages.join('</br>')
      render template: "/backends/tickets/edit"
    end
  end

  def event
    if @events.include?(params[:event].to_sym)
      @ticket.send(params[:event])
      @ticket.save
    end
    @message = "變更狀態成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_tickets_path)
      }
    end  
  end

  def destroy
    @ticket.destroy

    @message = "刪除成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_tickets_path) 
      }
    end  


  end

  private

  def find_ticket
    @ticket = Ticket.find(params[:id])

    add_breadcrumb @ticket.name
  end  

  def ticket_params_permit
    params.require(:ticket).permit(
	  :cover,       
	  :image1,      
	  :image2,     
	  :image3, 
	  :image4,     
	  :name,       
	  :price,       
	  :intro, 
    :the_group,   
	  :content,
    :article1,
    :article2,
    :article3,
    :article4,
    :article5,
    :article6,  
    :go_date,
    :back_date   
    )  
  end
end
