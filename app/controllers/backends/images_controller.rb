class Backends::ImagesController < BackendsController
  
  skip_before_action :verify_authenticity_token
  before_action :find_image,only: %w(edit update destroy)
  def ck_upload
    @image = Image.create(file: params[:upload])

    # render :text=>u.obj_tmp.url
    respond_to do |format|
      format.js {

      }
      format.html {
        #render :template => "backends/images/ck_upload.text"
        #render layout: false, plain: "<script>window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]},\"#{@image.file.url}\")</script>"
        render layout: false, plain: %Q(<html><body><script type="text/javascript">window.parent.CKEDITOR.tools.callFunction('#{params[:CKEditorFuncNum]}', "#{@image.file.url}\");</script></body></html>)
        return
      }
    end
  end
  def dropzone
    @image = Image.create!(image_params_permit)

    respond_to do |format|
      format.json {
        #@response = @image.to_json
        #@response['destroy_url'] = backends_image_path(@image)
        render :json => @image.as_json.merge(
            url: backends_image_path(@image,format: :json),
            edit_url: edit_backends_image_path(@image)
          ).to_json
      }
    end    
  end


  def create
    @image = Image.create(file: params[:file])

    respond_to do |format|
      format.html {
        redirect_to :back,{flash: {success: "create"}}
      }
      format.json {
        render :json => @image.to_json
      }
    end
  end

  def update
    @image.update(image_params_permit)

    respond_to do |format|
      format.html {
        redirect_to :back,{flash: {success: "update"}}
      }
      format.json {
        render :json => @image.to_json
      }
    end
  end

  def edit
    #@image.build_missing_locale_set
    render layout: false 
  end

  def destroy
    @image.destroy
    flash[:success] = "刪除成功"
    redirect_back(fallback_location: root_path)
  end

  def sort
    @attachments = Attachment.mark.where(id: params[:sort])

    @attachments.each do |a|
      a.update(rank: params[:sort].index(a.id.to_s))
    end

    render json: 'sort_success'
  end


  private

  def find_image
    @image = Image.find_by(id: params[:id])
  end

  def image_params_permit
    params.require(:image).permit(
        :file,
        :item_type,
        :item_id,
 
      )
  end
  
end
