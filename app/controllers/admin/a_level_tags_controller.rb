class Admin::ALevelTagsController < ApplicationController
  before_action :set_a_level_tag, only: [:show, :edit, :update, :destroy]

  # GET /a_level_tags
  # GET /a_level_tags.json
  def index
    @a_level_tags = ALevelTag.all
  end

  # GET /a_level_tags/1
  # GET /a_level_tags/1.json
  def show
  end

  # GET /a_level_tags/new
  def new
    @a_level_tag = ALevelTag.new
  end

  # GET /a_level_tags/1/edit
  def edit
  end

  # POST /a_level_tags
  # POST /a_level_tags.json
  def create
    @a_level_tag = ALevelTag.new(a_level_tag_params)

    respond_to do |format|
      if @a_level_tag.save
        format.html { redirect_to @a_level_tag, notice: 'A level tag was successfully created.' }
        format.json { render :show, status: :created, location: @a_level_tag }
      else
        format.html { render :new }
        format.json { render json: @a_level_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /a_level_tags/1
  # PATCH/PUT /a_level_tags/1.json
  def update
    respond_to do |format|
      if @a_level_tag.update(a_level_tag_params)
        format.html { redirect_to @a_level_tag, notice: 'A level tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @a_level_tag }
      else
        format.html { render :edit }
        format.json { render json: @a_level_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /a_level_tags/1
  # DELETE /a_level_tags/1.json
  def destroy
    @a_level_tag.destroy
    respond_to do |format|
      format.html { redirect_to a_level_tags_url, notice: 'A level tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a_level_tag
      @a_level_tag = ALevelTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def a_level_tag_params
      params[:a_level_tag]
    end
end
