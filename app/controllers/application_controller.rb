class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_admin, :current_system

  before_action :current_meta_tags

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::InvalidAuthenticityToken, with: :without_token

  protected

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin])
  end

  def current_system
    @current_system ||= System.first
  end

  def current_meta_tags
    set_meta_tags site: current_system&.title
    set_meta_tags description: current_system&.description
    set_meta_tags keywords: current_system&.keywords

    set_meta_tags og: {
      title:  current_system&.name,
      site_name: current_system&.title,
      type: 'website',
      url: request.original_url,
      image: "http://#{request.host}/img/logo2@2x.png",
    }
  end

  def not_found(e)
    @message = e
    respond_to do |format|
      format.html {
        render text: @message
      }
      format.js {
        render template: "/home/error"
      }
    end 
    return 
  end

  def without_token(e)
    @message = e
    respond_to do |format|
      format.html {
        flash[:error] = @message
        redirect_back(fallback_location: root_path)
      }
      format.js {
        render template: "/home/error"
      }
    end 
    return 
  end

end
