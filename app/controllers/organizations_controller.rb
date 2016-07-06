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
    f1 = FundingSent.select('"funding_sents".*, "orgrcvd".address AS addressrcvd, "orgsent".address addresssent').from('"funding_sents" INNER JOIN "organizations" "orgrcvd" ON "orgrcvd"."id" = "funding_sents"."organization_id_received" INNER JOIN "organizations" "orgsent" ON "orgsent"."id" = "funding_sents"."organization_id_sent"').where("funding_sents.organization_id_received = ?", params[:id])
    f2 = FundingSent.select('"funding_sents".*, "orgrcvd".address AS addressrcvd, "orgsent".address addresssent').from('"funding_sents" INNER JOIN "organizations" "orgrcvd" ON "orgrcvd"."id" = "funding_sents"."organization_id_received" INNER JOIN "organizations" "orgsent" ON "orgsent"."id" = "funding_sents"."organization_id_sent"').where("funding_sents.organization_id_sent = ?", params[:id])

    results=[]
    f1.each do |funding_received|
      results.push([funding_received.addresssent, funding_received.addressrcvd]);
    end

    f2.each do |funding_sent|
      results.push([funding_sent.addresssent, funding_sent.addressrcvd]);
    end

    render :json => results
  end
end
