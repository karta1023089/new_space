class Backends::SystemController < Backends::ResourcesController

  def edit

  end

  private

  def current_object
    # 用 default_scope 限制搜尋的範圍
    @current_object ||= current_system
  end

  def permitted_attributes
    [
      :name, 
      :title, 
      :description, 
      :keyword, 
      :phone,
      :address, 
      :email,
      :youtube
    ] + System.stored_attributes[:socials].map(&:to_sym)
  end  


end
