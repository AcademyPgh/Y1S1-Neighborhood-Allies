class OrganizationsController < ApplicationController

  def show
    @organizations = Organization.find(params[:id])
  end

  def index
    @organizations = Organization.allra
  end

  def index_landing
    @organizations = Organization.all
  end

  def about
    @org = Organization.find(params[:id])
    render :json =>@org.as_json(:only =>[:name, :phone])
  end

  def showvectors
    incoming_connections = Organization.find(params[:id]).funding_receives
    # incoming_connections = [] # FundingSent.select('"funding_sents".funding_type_id, "orgrcvd".latitude AS orgrcvdlat, "orgrcvd".longitude AS orgrcvdlong, "orgsent".latitude AS orgsentlat, "orgsent".longitude AS orgsentlong').from('"funding_sents" INNER JOIN "organizations" "orgrcvd" ON "orgrcvd"."id" = "funding_sents"."organization_id_received" INNER JOIN "organizations" "orgsent" ON "orgsent"."id" = "funding_sents"."organization_id_sent"').where("funding_sents.organization_id_received = ?", params[:id])
    outgoing_connections = Organization.find(params[:id]).funding_sents
    results=[]
    incoming_connections.each do |funding_received|
      #funding_received.organization_from.latitude
      results.push([funding_received.organization_from.latitude, funding_received.organization_from.longitude, funding_received.organization_to.latitude, funding_received.organization_to.longitude, funding_received.funding_type_id]);
    end

    outgoing_connections.each do |funding_sent|
      results.push([funding_sent.organization_from.latitude, funding_sent.organization_from.longitude, funding_sent.organization_to.latitude, funding_sent.organization_to.longitude, funding_sent.funding_type_id]);
    end

    render :json => results
  end
end
