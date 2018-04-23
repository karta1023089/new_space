class Backends::CategoriesController < BackendsController	
  before_action :find_category
  helper_method :current_cart
  def index
    Category.origin.create(:parent_id => 2,:name => "團體行程")
    if Category.category_types.keys.include?(params[:category_type])
      @categories = Category.send(params[:category_type]).where(parent_id: nil).order_by_priority_asc
    else
      redirect_to backends_categories_path(category_type: Category.category_types.keys[0])
    end
  end

  def new
    unless Category.category_types.keys.include?(params[:category_type])
      params[:category_type] = Category.category_types.keys[0]
    end
    @category = Category.send(params[:category_type]).new(parent_id: params[:parent_id])
    render layout: false
  end
  def show
    
    @main_ads = Image.main_ad
    @ad_deps = Category.is_ad
    @cheap_times_deps = Category.cheap_times_category
    @preview = true
    @Dep = @category
    @sorts = Category.where(:parent_id => @Dep.id)
    @Departs = Category.all
    products = Product.all
    #order是排序，sort是再塞選子分類
    if params[:sort].present?
      @products = products.where(:category_id => params[:sort]).order(:priority).page(params[:page]).per(15)
    else
      @products = products.where(:category_id => @Dep.children.pluck(:id)).order(params[:order], :priority).page(params[:page]).per(15)
    end
    @ads = Image.category_main_ad.where(:imageable_id => @Dep.id)
    @sliders = Image.category_slider_show.where(:imageable_id => @Dep.id)
    set_meta_tags title: @Dep.name
    @cheap_time_products = CheapTime.on_time.pluck(:product_id)
    render layout: "home",template: "/home/departments/show"
  end

  def create
    @category = Category.new(category_params_permit)
    if @category.valid?
      @category.save
 
      redirect_to backends_categories_path(category_type: @category.category_type),flash: {success: "Create!"}
    else
      redirect_to backends_categories_path(category_type: @category.category_type),flash: {error: @category.errors.full_messages.to_s}
    end
  end

  def edit
    @choose_parent = Category.send(@category.category_type)
    render layout: false
  end

  def sort
    @categories = Category.where(id: params[:sort])

    @categories.each do |category|
      category.update(priority: params[:sort].index("#{category.id}"))
    end

    render json: 'sort_success'
  end

  def update
    @category.update(category_params_permit)

    redirect_to backends_categories_path(category_type: @category.category_type),flash: {success: "更新成功"} 
  end

  def destroy
    @category.destroy

    redirect_to backends_categories_path,flash: {success: "刪除成功"}   
  end
  def open
    if @category.open_mark == true
       @category.open_mark = false
    else
       @category.open_mark = true
    end
       @category.save
    redirect_to backends_categories_path,flash: {success: "開啟成功!"} 
  end
  private

  def find_category
    @category = Category.find_or_initialize_by(id: params[:id])
  end

  def category_params_permit
    params.require(:category).permit(
        :name,
        :priority,
        :parent_id,
        :category_type,
        :cover_image
      )
  end 
end
