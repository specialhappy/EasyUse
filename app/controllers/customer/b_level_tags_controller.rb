class Customer::BLevelTagsController < ApplicationController
  before_action :set_b_level_tag, only: [:show, :edit, :update, :destroy]

  # GET /b_level_tags
  # GET /b_level_tags.json
  def index
    @b_level_tags = BLevelTag.all
  end

  # GET /b_level_tags/1
  # GET /b_level_tags/1.json
  def show
  end

  # GET /b_level_tags/new
  def new
    @b_level_tag = BLevelTag.new
  end

  # GET /b_level_tags/1/edit
  def edit
  end

  # POST /b_level_tags
  # POST /b_level_tags.json
  def create
    @b_level_tag = BLevelTag.new(b_level_tag_params)

    respond_to do |format|
      if @b_level_tag.save
        format.html { redirect_to @b_level_tag, notice: 'B level tag was successfully created.' }
        format.json { render :show, status: :created, location: @b_level_tag }
      else
        format.html { render :new }
        format.json { render json: @b_level_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /b_level_tags/1
  # PATCH/PUT /b_level_tags/1.json
  def update
    respond_to do |format|
      if @b_level_tag.update(b_level_tag_params)
        format.html { redirect_to @b_level_tag, notice: 'B level tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @b_level_tag }
      else
        format.html { render :edit }
        format.json { render json: @b_level_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /b_level_tags/1
  # DELETE /b_level_tags/1.json
  def destroy
    @b_level_tag.destroy
    respond_to do |format|
      format.html { redirect_to b_level_tags_url, notice: 'B level tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b_level_tag
      @b_level_tag = BLevelTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def b_level_tag_params
      params[:b_level_tag]
    end
end
