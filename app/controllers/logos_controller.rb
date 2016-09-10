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
   if params[:logo].tempfile
     @logo.data = params[:logo].tempfile.read
     @logo.filename = params[:logo].original_filename
     @logo.mime_type = params[:logo].content_type
   end
     #normal save
    if @logo.save
      puts "I saved properly!"
      #time to delete all of the old ones so only one logo exists per company
      Logo.where(organization_id: @logo.organization_id).where.not(id: @logo.id).delete_all
      redirect_to(@logo, :notice => "Successfully Posted Photo")
    else
      puts "Here is the info on stuff: "
      puts @logo
      puts params[:logo]
      
      render :action => "new"
    end
  end
 
  def serve
    @logo = Logo.find_by(:organization_id => params[:id])
    if @logo.nil?
      @logo = Logo.find_by(:organization_id => 2); #hard coded to academy pgh right now, should be fixed to one that is created properly by rake
    end
    send_data(@logo.data, :type => @logo.mime_type, :filename => "#{@logo.name}.jpg", :disposition => "inline")
  end
  
  def destroy
    @logo = Logo.find(params[:id])
    @logo.destroy
    redirect_to(photos_url)
  end
  
  private
    def user_params
      params.require(:logo).permit(:name, :data, :filename,:mime_type)
    end
  
end
