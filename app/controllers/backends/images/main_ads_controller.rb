class Backends::Images::MainAdsController < BackendsController

    before_action :defind_slider
	before_action :find_slider, except: %w(index)

	def index
		@slides = @Slides
	end

	def new
		
	end

	def create
		@slide = MyAd.main_ad.new(slider_params_permit)
    if @slide.valid?
      @slide.save
      flash[:success] = "建立成功."

      redirect_to backends_images_main_ads_path ,flash: { success: '新增成功'}
    else
      flash[:error] = @slide.errors.full_messages.to_s

      render template: "/backends/images/main_ads/new"
    end
	end

	def edit
		
	end

	def update
		@slide.update(slider_params_permit)

    redirect_to backends_images_main_ads_path,flash: { success: '更新成功'}
	end

	def destroy
		@slide.destroy

    redirect_to backends_images_main_ads_path,flash: { success: '刪除成功'}
	end

	private

	def defind_slider
        @Slides = MyAd.main_ad
	end

	def find_slider
		@slide = @Slides.find_or_initialize_by(id: params[:id])
	end

	def slider_params_permit
		params.require(:image).permit(
			:url,
			:file,
			:name
			)
	end
end
