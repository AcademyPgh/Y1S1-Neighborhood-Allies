class OrganizationController < ApplicationController
  def index
    @orgs = Organization.all
  end

  def show
    @org = Organization.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
