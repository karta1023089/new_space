class Home::ContactsController < ApplicationController 
	def create
		@contact = Contact.create!(contact_params_permit)

		flash[:success] = "感謝您的來函，我們會盡快與您聯繫"
    redirect_back(fallback_location: root_path)
	end

	protected

	def contact_params_permit
    params.require(:contact).permit(
      :name,
      :email,
      :content,
    )     
  end  
end