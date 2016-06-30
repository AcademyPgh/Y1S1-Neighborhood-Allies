class OrganizationsController < ApplicationController


  def show
    @org = Organization.find(params[:id])
  end
  
  def index_landing
    @organizations = Organization.all
  end

  def about
    @org = Organization.find(params[:id])
    render :json =>@org.as_json(:only =>[:name, :phone])
  end

end
