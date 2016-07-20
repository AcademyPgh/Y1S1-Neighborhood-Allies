class OrgadminsController < ApplicationController
  before_action :set_orgadmin, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /orgadmins
  # GET /orgadmins.json
  def index
    @organizations = Organization.all
  end

  # GET /orgadmins/1
  # GET /orgadmins/1.json
  def show
  end

  # GET /orgadmins/new
  def new
    @organization = Organization.new
  end

  # GET /orgadmins/1/edit
  def edit
    @orgs = Organization.all
    @logo = Logo.new
    @fundtypes = FundingType.all
  end

  # POST /orgadmins
  # POST /orgadmins.json
  def create
    @organization = Organization.new(orgadmin_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orgadmins/1
  # PATCH/PUT /orgadmins/1.json
  def update
    respond_to do |format|
      if @organization.update(orgadmin_params)
        puts params[:name]
        puts @organization.name
        puts orgadmin_params
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgadmins/1
  # DELETE /orgadmins/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to orgadmins_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def showorgconnections
    @fundingsents = FundingSent.select('"orgrcvd".name, "funding_types".fundtype').from('"funding_sents" INNER JOIN "organizations" "orgrcvd" ON "orgrcvd"."id" = "funding_sents"."organization_id_received" INNER JOIN "organizations" "orgsent" ON "orgsent"."id" = "funding_sents"."organization_id_sent" INNER JOIN "funding_types" ON "funding_types"."id" = "funding_sents"."funding_type_id"').where("funding_sents.organization_id_sent = ?", params[:id])
    
    results = []
    
    @fundingsents.each do |funding_sent|
      results.push([funding_sent.name, funding_sent.fundtype]);
    end

    render :json => results
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orgadmin
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orgadmin_params
      params.permit(:name, :email, :address, :phone, :id, :descrip)
    end
end
