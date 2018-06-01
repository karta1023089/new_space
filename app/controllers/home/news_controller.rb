class Home::NewsController < HomeController
	skip_before_action :current_meta_tags, only: :show
	def index
		@contents = Content.order_by_created_at_desc.first(7)
	end
	def show
		@content = Content.find(params[:id])
	set_meta_tags site: @content.name
    set_meta_tags description: current_system&.description
    set_meta_tags keywords: current_system&.keywords

    set_meta_tags og: {
      title: @content.name,
      site_name: current_system&.title,
      type: 'website',
      url: request.original_url,
      image: @content.cover,
    }
    end
end
