class Backends::GroupImagesController < BackendsController
	  before_action :find_group_image,:except => [:index,:events_group,:new,:create]

  def index
   
    if GroupImage.group_types.keys.include?(params[:group_type])
      @group_images = GroupImage.send(params[:group_type])
    else
       redirect_to backends_group_images_path(group_type: GroupImage.group_types.keys[0])
       return
    end

    if @group_images.present?
      @group_image = @group_images.first
    else
      @group_image = @group_images.create()
    end

    redirect_to backends_group_image_path(@group_image)
  end

  def show
    @group_image = GroupImage.find(params[:id])
  end

  def edit
    render layout: false
  end

  def update
    @group_image.update(group_image_params_permit)

    redirect_to :back
  end
  def events_group
    @group_images = GroupImage.mark.send("eventsphoto")
  end
  def new
    
  end
  def create
     @group_image = GroupImage.create(group_image_params_permit)
     @group_image.group_type = 1
     @group_image.save
    redirect_to backends_group_image_path(@group_image)
  end
  def destroy
    
    @group_image.del_mark = true
    @group_image.save
    redirect_to :back
  end

  private

  def find_group_image
    @group_image = GroupImage.find(params[:id])
  end

  def group_image_params_permit
    params.require(:group_image).permit(
        :name,
        :remark,
        :width,
        :height
      )
  end
end
