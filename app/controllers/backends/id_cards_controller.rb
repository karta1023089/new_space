class Backends::IdCardsController < BackendsController

  add_breadcrumb IdCard.model_name.human, :backends_id_cards_path
  before_action :find_id_card,except: %w(index new create)
  def index
    # @projects = Project.order_by_created_at_desc
    @id_cards = IdCard.all

    @id_cards = @id_cards.page(params[:page])

  end

  def new
    @id_card = IdCard.new

    add_breadcrumb "新增", new_backends_id_card_path
  end

  def create
    @id_card = IdCard.new(id_card_params_permit)
    if @id_card.valid?
      @id_card.save!
      flash[:success] = "新增成功."
      @id_card.save

      redirect_to backends_id_cards_path
    else
      flash[:error] = @id_card.errors.full_messages.join('</br>')
      
      render template: "/backends/id_cards/new"
    end  
  end

  def show
  end

  def nokogiri
    render json: @id_card.nokogiri
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
    add_breadcrumb "編輯", edit_backends_id_card_path(@id_card)
  end

  def update
    if @id_card.update(id_card_params_permit)
      flash[:success] = "編輯成功."
      
      redirect_back(fallback_location: edit_backends_id_card_path(@id_card))
    else
      flash[:error] = @id_card.errors.full_messages.join('</br>')
      render template: "/backends/id_cards/edit"
    end
  end

  def event
    if @events.include?(params[:event].to_sym)
      @id_card.send(params[:event])
      @id_card.save
    end
    @message = "變更狀態成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_id_cards_path)
      }
    end  
  end

  def destroy
    @id_card.destroy

    @message = "刪除成功."

    respond_to do |format|
      format.js {
        #render layout: false
      }
      format.html {
        flash[:success] = @message
        redirect_back(fallback_location: backends_id_cards_path) 
      }
    end  


  end

  private

  def find_id_card
    @id_card = IdCard.find(params[:id])

    add_breadcrumb @id_card.name
  end  

  def id_card_params_permit
    params.require(:id_card).permit(
	  :cover,           
	  :name, 
    :make_day,           
	  :content, 
    :the_group    
    )  
  end
end
