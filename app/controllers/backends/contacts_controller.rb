class Backends::ContactsController < BackendsController
  before_action :find_contact, :except => :index
  def index
    @contacts = Contact.order_by_created_at_desc.page(params[:page])
  end
  def show
    @Contact.reply_mark = true
    @Contact.save
    flash[:success] = '回覆'
    redirect_back(:fallback_location => "/backends")
  end
  def update
    if params[:contact][:reply].present?
    @Contact.update(content_params_permit)
    @Contact.reply_mark = true
    @Contact.save
    #UserMailer.reply(@Contact).deliver_now!
    flash[:success] = '回覆成功'
    redirect_back(:fallback_location => "/backends")
    else
    flash[:success] = '回覆不可為空'
    redirect_back(:fallback_location => "/backends")
    end
    
  end

  def destroy
    @Contact.destroy
    flash[:success] = '刪除成功'
    redirect_back(:fallback_location => "/backends")
  end
  private

   def find_contact
    @Contact = Contact.find_or_initialize_by(id: params[:id])
  end


  def content_params_permit
    params.require(:contact).permit(
        :reply
        
      )
  end
  def order_by
    unless Contact.order_by.include?(params[:order_by])
      params[:order_by] = Contact.order_by[0]
    end
    return params[:order_by]
  end

end
