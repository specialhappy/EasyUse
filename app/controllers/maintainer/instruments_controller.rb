class Maintainer::InstrumentsController < ApplicationController
  before_action :set_maintainer_instrument, only: [:show, :edit, :update, :destroy]
  layout 'customerlayout'

  # GET /maintainer/instruments
  # GET /maintainer/instruments.json
  def index
    @user=User.find(session[:user_id])
    @maintainer_instruments = @user.instruments
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
    @user=User.find(session[:user_id])
    @maintainer_instrument.user_id=@user.id
    #    @miantainer_instrument.institution_id=@user.institution_id
    
    uploaded_io = img_url_param[:img_url]
    if uploaded_io.nil? == false
      name=getFileName(uploaded_io)
      File.open(Rails.root.join('app','assets', 'images', name), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    @maintainer_instrument.img_url = name
    end
    
    respond_to do |format|
      if @maintainer_instrument.save
        format.html { redirect_to [:maintainer, @maintainer_instrument], notice: '发布仪器成功！' }
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

    uploaded_io = img_url_param[:img_url]
    if uploaded_io.nil? == false
      name=getFileName(uploaded_io)
      File.open(Rails.root.join('app','assets', 'images', name), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    @maintainer_instrument.img_url = name
    end
    
    respond_to do |format|
      if @maintainer_instrument.update(maintainer_instrument_params)
        format.html { redirect_to [:maintainer, @maintainer_instrument], notice: '修改仪器成功！' }
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
    params.require(:instrument).permit(:name, :model, :price, :fee_per_hour, :description, :status, :user_id, :institution_id)
  end

  def img_url_param
    params.require(:instrument).permit(:img_url)
  end

  def getFileName(uploaded_io)
    if uploaded_io.nil? == false
      strs=uploaded_io.content_type.to_s.split("/")
      time=Time.new.to_s
      fileName=time+'.'+strs[1]
    return fileName
    end
  end
end
