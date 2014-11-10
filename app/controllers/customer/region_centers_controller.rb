class Customer::RegionCentersController < ApplicationController
  before_action :set_region_center, only: [:show, :edit, :update, :destroy]
    layout 'customerlayout'
  # GET /region_centers
  # GET /region_centers.json
  def index
    @region_centers = RegionCenter.all
  end

  # GET /region_centers/1
  # GET /region_centers/1.json
  def show
  end

  # GET /region_centers/new
  def new
    @region_center = RegionCenter.new
  end

  # GET /region_centers/1/edit
  def edit
  end

  # POST /region_centers
  # POST /region_centers.json
  def create
    @region_center = RegionCenter.new(region_center_params)

    respond_to do |format|
      if @region_center.save
        format.html { redirect_to @region_center, notice: 'Region center was successfully created.' }
        format.json { render :show, status: :created, location: @region_center }
      else
        format.html { render :new }
        format.json { render json: @region_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /region_centers/1
  # PATCH/PUT /region_centers/1.json
  def update
    respond_to do |format|
      if @region_center.update(region_center_params)
        format.html { redirect_to @region_center, notice: 'Region center was successfully updated.' }
        format.json { render :show, status: :ok, location: @region_center }
      else
        format.html { render :edit }
        format.json { render json: @region_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /region_centers/1
  # DELETE /region_centers/1.json
  def destroy
    @region_center.destroy
    respond_to do |format|
      format.html { redirect_to region_centers_url, notice: 'Region center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region_center
      @region_center = RegionCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_center_params
      params.require(:region_center).permit(:name, :description, :url)
    end
end
