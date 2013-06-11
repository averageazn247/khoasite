class AttachmentsController < ApplicationController
    def show
        @attachment = Attachment.find(params[:id])
        send_data @attachment.data, :filename => @attachment.filename, :type => @attachment.content_type
    end

    def create      
        return if params[:attachment].blank?

        @attachment = Attachment.new
        @attachment.uploaded_file = params[:attachment]

        if @attachment.save
            flash[:notice] = "Thank you for your submission..."
            redirect_to :action => "index"
        else
            flash[:error] = "There was a problem submitting your attachment."
            render :action => "new"
        end
    end
    
  
  def upload
    file_field = @params['form']['file'] rescue nil
    # file_field is a StringIO object
    file_field.content_type # 'text/csv'
    file_field.full_original_filename
    
  end

end
