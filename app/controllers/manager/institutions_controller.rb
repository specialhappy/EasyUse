class Manager::InstitutionsController < ApplicationController
  before_action :set_manager_institution, only: [:show, :edit, :update, :destroy]
layout 'customerlayout'
  # GET /manager/institutions
  # GET /manager/institutions.json
  def index
    @manager_institutions = Institution.all
    @region_centers = RegionCenter.all
  end

  # GET /manager/institutions/1
  # GET /manager/institutions/1.json
  def show
  end

  # GET /manager/institutions/new
  def new
    @manager_institution = Institution.new
    @region_centers = RegionCenter.all
  end

  # GET /manager/institutions/1/edit
  def edit
  end

  # POST /manager/institutions
  # POST /manager/institutions.json
  def create
    @manager_institution = Institution.new(manager_institution_params)
    region_center = params[:region_center]
    @manager_institution.region_center_id = region_center[:region_center_id]

    respond_to do |format|
      if @manager_institution.save
        format.html { redirect_to [:manager, @manager_institution], notice: 'Institution was successfully created.' }
        format.json { render :show, status: :created, location: @manager_institution }
      else
        format.html { render :new }
        format.json { render json: @manager_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/institutions/1
  # PATCH/PUT /manager/institutions/1.json
  def update
    respond_to do |format|
      if @manager_institution.update(manager_institution_params)
        format.html { redirect_to [:manager, @manager_institution], notice: 'Institution was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_institution }
      else
        format.html { render :edit }
        format.json { render json: @manager_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/institutions/1
  # DELETE /manager/institutions/1.json
  def destroy
    @manager_institution.destroy
    respond_to do |format|
      format.html { redirect_to manager_institutions_url, notice: 'Institution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_institution
      @manager_institution = Institution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_institution_params
      params.require(:institution).permit(:name, :description, :url, :region_center_id)
    end
end
