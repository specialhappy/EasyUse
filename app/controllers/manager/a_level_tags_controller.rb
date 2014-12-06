class Manager::ALevelTagsController < ApplicationController
  before_action :set_manager_a_level_tag, only: [:show, :edit, :update, :destroy]
layout 'customerlayout'
  # GET /manager/a_level_tags
  # GET /manager/a_level_tags.json
  def index
    @manager_a_level_tags = ALevelTag.all
  end

  # GET /manager/a_level_tags/1
  # GET /manager/a_level_tags/1.json
  def show
  end

  # GET /manager/a_level_tags/new
  def new
    @manager_a_level_tag = ALevelTag.new
  end

  # GET /manager/a_level_tags/1/edit
  def edit
  end

  # POST /manager/a_level_tags
  # POST /manager/a_level_tags.json
  def create
    @manager_a_level_tag = ALevelTag.new(manager_a_level_tag_params)

    respond_to do |format|
      if @manager_a_level_tag.save
        format.html { redirect_to [:manager, @manager_a_level_tag], notice: 'A level tag was successfully created.' }
        format.json { render :show, status: :created, location: @manager_a_level_tag }
      else
        format.html { render :new }
        format.json { render json: @manager_a_level_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/a_level_tags/1
  # PATCH/PUT /manager/a_level_tags/1.json
  def update
    respond_to do |format|
      if @manager_a_level_tag.update(manager_a_level_tag_params)
        format.html { redirect_to [:manager, @manager_a_level_tag], notice: 'A level tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_a_level_tag }
      else
        format.html { render :edit }
        format.json { render json: @manager_a_level_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/a_level_tags/1
  # DELETE /manager/a_level_tags/1.json
  def destroy
    @manager_a_level_tag.destroy
    respond_to do |format|
      format.html { redirect_to manager_a_level_tags_url, notice: 'A level tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_a_level_tag
      @manager_a_level_tag = ALevelTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_a_level_tag_params
      params.require(:a_level_tag).permit(:name, :description)
    end
end
