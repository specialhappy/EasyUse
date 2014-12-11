class Manager::BLevelTagsController < ApplicationController
  before_action :set_manager_b_level_tag, only: [:show, :edit, :update, :destroy]
layout 'customerlayout'
  # GET /manager/b_level_tags
  # GET /manager/b_level_tags.json
  def index
    @manager_b_level_tags = BLevelTag.all
    @manager_a_level_tags = ALevelTag.all
  end

  # GET /manager/b_level_tags/1
  # GET /manager/b_level_tags/1.json
  def show
  end

  # GET /manager/b_level_tags/new
  def new
    @manager_b_level_tag = BLevelTag.new
    @a_level_tags = ALevelTag.all
  end

  # GET /manager/b_level_tags/1/edit
  def edit
  end

  # POST /manager/b_level_tags
  # POST /manager/b_level_tags.json
  def create
    a_level_tag = params[:a_level_tag]
    @manager_b_level_tag = BLevelTag.new(manager_b_level_tag_params)
    @manager_b_level_tag.a_level_tag_id = a_level_tag[:a_level_tag_id]

    respond_to do |format|
      if @manager_b_level_tag.save
        format.html { redirect_to [:manager, @manager_b_level_tag], notice: 'B level tag was successfully created.' }
        format.json { render :show, status: :created, location: @manager_b_level_tag }
      else
        format.html { render :new }
        format.json { render json: @manager_b_level_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/b_level_tags/1
  # PATCH/PUT /manager/b_level_tags/1.json
  def update
    respond_to do |format|
      if @manager_b_level_tag.update(manager_b_level_tag_params)
        format.html { redirect_to [:manager, @manager_b_level_tag], notice: 'B level tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_b_level_tag }
      else
        format.html { render :edit }
        format.json { render json: @manager_b_level_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/b_level_tags/1
  # DELETE /manager/b_level_tags/1.json
  def destroy
    @manager_b_level_tag.destroy
    respond_to do |format|
      format.html { redirect_to manager_b_level_tags_url, notice: 'B level tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_b_level_tag
      @manager_b_level_tag = BLevelTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_b_level_tag_params
      params.require(:b_level_tag).permit(:name, :description, :a_level_tag_id)
    end
    
end
