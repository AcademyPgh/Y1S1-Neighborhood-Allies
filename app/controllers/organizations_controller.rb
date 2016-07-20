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
    f1 = [] # FundingSent.select('"funding_sents".funding_type_id, "orgrcvd".latitude AS orgrcvdlat, "orgrcvd".longitude AS orgrcvdlong, "orgsent".latitude AS orgsentlat, "orgsent".longitude AS orgsentlong').from('"funding_sents" INNER JOIN "organizations" "orgrcvd" ON "orgrcvd"."id" = "funding_sents"."organization_id_received" INNER JOIN "organizations" "orgsent" ON "orgsent"."id" = "funding_sents"."organization_id_sent"').where("funding_sents.organization_id_received = ?", params[:id])
    f2 = FundingSent.select('"funding_sents".funding_type_id, "orgrcvd".latitude AS orgrcvdlat, "orgrcvd".longitude AS orgrcvdlong, "orgsent".latitude AS orgsentlat, "orgsent".longitude AS orgsentlong').from('"funding_sents" INNER JOIN "organizations" "orgrcvd" ON "orgrcvd"."id" = "funding_sents"."organization_id_received" INNER JOIN "organizations" "orgsent" ON "orgsent"."id" = "funding_sents"."organization_id_sent"').where("funding_sents.organization_id_sent = ?", params[:id])

    results=[]
    f1.each do |funding_received|
      #results.push([funding_received.orgrcvdlat, funding_received.orgrcvdlong, funding_received.orgsentlat, funding_received.orgsentlong, funding_received.funding_type_id]);
    end

    f2.each do |funding_sent|
      results.push([funding_sent.orgrcvdlat, funding_sent.orgrcvdlong, funding_sent.orgsentlat, funding_sent.orgsentlong, funding_sent.funding_type_id]);
    end

    render :json => results
  end
end
