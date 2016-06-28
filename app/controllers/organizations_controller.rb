class OrganizationsController < ApplicationController
  def index
    @orgs = Organization.all
  end

  def show
    @org = Organization.find(params[:id])
  end
end
