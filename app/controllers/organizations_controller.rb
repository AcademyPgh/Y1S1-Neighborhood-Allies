class OrganizationsController < ApplicationController

  def show
    @org = Organization.find(params[:id])
  end

  def index
    @organizations = Organization.all
  end

  def index_landing
    @organizations = Organization.all
  end

  def about
    @org = Organization.find(params[:id])
    render :json =>@org.as_json(:only =>[:name, :phone])
  end

  def showvectors
    f1 = FundingSent.where("organization_id_received = ?", params[:id])
    f2 = FundingSent.where("organization_id_sent = ?", params[:id])

    results=[]
    f1.each do |funding_received|
      results.push([funding_received.organization_id_sent, funding_received.organization_id_received]);
    end

    f2.each do |funding_sent|
      results.push([funding_sent.organization_id_sent, funding_sent.organization_id_received]);
    end

    render :json => results
  end
end
