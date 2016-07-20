class LogosController < ApplicationController
protect_from_forgery :except => [:update, :delete, :create]

  def index
    @logos = Logo.all

  end

  def show
  end

  def new
    @logo = Logo.new
    @orgs = Organization.all
  end

  def create
   puts "l"
   
   @logo = Logo.new()
   @logo.name = params[:name]
   @logo.organization_id = params[:organization_id]
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
    @logo = Logo.find_by(:organization_id => params[:id])
    if @logo.nil?
      @logo = Logo.find(1);
    end
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
