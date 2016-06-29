class OrganizationsController < ApplicationController


  def show
    @org = Organization.find(params[:id])
  end
  def index
    @organizations = Organization.all
  end

end
