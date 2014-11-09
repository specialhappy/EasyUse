class Customer::PriviligesController < ApplicationController
  before_action :set_privilige, only: [:show, :edit, :update, :destroy]

  # GET /priviliges
  # GET /priviliges.json
  def index
    @priviliges = Privilige.all
  end

  # GET /priviliges/1
  # GET /priviliges/1.json
  def show
  end

  # GET /priviliges/new
  def new
    @privilige = Privilige.new
  end

  # GET /priviliges/1/edit
  def edit
  end

  # POST /priviliges
  # POST /priviliges.json
  def create
    @privilige = Privilige.new(privilige_params)

    respond_to do |format|
      if @privilige.save
        format.html { redirect_to @privilige, notice: 'Privilige was successfully created.' }
        format.json { render :show, status: :created, location: @privilige }
      else
        format.html { render :new }
        format.json { render json: @privilige.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /priviliges/1
  # PATCH/PUT /priviliges/1.json
  def update
    respond_to do |format|
      if @privilige.update(privilige_params)
        format.html { redirect_to @privilige, notice: 'Privilige was successfully updated.' }
        format.json { render :show, status: :ok, location: @privilige }
      else
        format.html { render :edit }
        format.json { render json: @privilige.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /priviliges/1
  # DELETE /priviliges/1.json
  def destroy
    @privilige.destroy
    respond_to do |format|
      format.html { redirect_to priviliges_url, notice: 'Privilige was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privilige
      @privilige = Privilige.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def privilige_params
     params.require(:privilige).permit(:name, :description)
    end
end
