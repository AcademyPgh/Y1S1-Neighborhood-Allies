class LogosController < ApplicationController
  def index
    @logos = Logo.all

  end

  def show
  end

  def new
    @logo = Logo.new
  end

  def create
   puts "l"
   
   @logo = Logo.new()
   @logo.name = params[:logo][:name]
   if params[:logo][:data]
     @logo.data = params[:logo][:data].read
     @logo.filename = params[:logo][:data].original_filename
     @logo.mime_type = params[:logo][:data].content_type
   end
     #normal save
    if @logo.save
      redirect_to(@logo, :notice => "Successfully Posted Photo")
    else
      render :action => "new"
    end
  end
 
  def serve
    @logo = Logo.find(params[:id])
    send_data(@logo.data, :type => @logo.mime_type, :filename => "#{@logo.name}.jpg", :disposition => "inline")
  end
  
  def destroy
    @logo = Photo.find(params[:id])
    @logo.destroy
    redirect_to(photos_url)
  end
  
  private
    def user_params
      params.require(:logo).permit(:name, :data, :filename,:mime_type)
    end
  
end
