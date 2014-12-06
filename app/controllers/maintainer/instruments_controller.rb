class Maintainer::InstrumentsController < ApplicationController
  before_action :set_maintainer_instrument, only: [:show, :edit, :update, :destroy]
layout 'customerlayout'
  # GET /maintainer/instruments
  # GET /maintainer/instruments.json
  def index
    @maintainer_instruments = Instrument.all
  end

  # GET /maintainer/instruments/1
  # GET /maintainer/instruments/1.json
  def show
  end

  # GET /maintainer/instruments/new
  def new
    @maintainer_instrument = Instrument.new
  end

  # GET /maintainer/instruments/1/edit
  def edit
  end

  # POST /maintainer/instruments
  # POST /maintainer/instruments.json
  def create
    @maintainer_instrument = Instrument.new(maintainer_instrument_params)

    respond_to do |format|
      if @maintainer_instrument.save
        format.html { redirect_to [:maintainer, @maintainer_instrument], notice: 'Instrument was successfully created.' }
        format.json { render :show, status: :created, location: @maintainer_instrument }
      else
        format.html { render :new }
        format.json { render json: @maintainer_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintainer/instruments/1
  # PATCH/PUT /maintainer/instruments/1.json
  def update
    respond_to do |format|
      if @maintainer_instrument.update(maintainer_instrument_params)
        format.html { redirect_to [:maintainer, @maintainer_instrument], notice: 'Instrument was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintainer_instrument }
      else
        format.html { render :edit }
        format.json { render json: @maintainer_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintainer/instruments/1
  # DELETE /maintainer/instruments/1.json
  def destroy
    @maintainer_instrument.destroy
    respond_to do |format|
      format.html { redirect_to maintainer_instruments_url, notice: 'Instrument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintainer_instrument
      @maintainer_instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintainer_instrument_params
      params.require(:instrument).permit(:name, :model, :price, :fee_per_hour, :img_url, :description, :status, :user_id, :institution_id)
    end
end
