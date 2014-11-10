class Admin::InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/instruments
  # GET /admin/instruments.json
  def index
  end

  #GET /admin/instruments/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    instruments=Instrument.order("id").limit(limit).offset(start)
    count=Instrument.count :all
   render :text =>get_json(count,instruments.to_json)
  end
  
  # GET /instruments/1
  # GET /instruments/1.json
  def show
  end

  # GET /instruments/new
  def new
  end

  # GET /instruments/1/edit
  def edit
  end

  # POST /instruments
  # POST /instruments.json
  def create
        @instrument = Instrument.new(:name => params[:name].to_s,:model => params[:model].to_s,:price => params[:price],:img_url => params[:img_url].to_s,:status => params[:status].to_s,:description => params[:description].to_s)
    info = @instrument.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/instruments/1/modify
  def modify
    begin
        instrument = Instrument.find(params[:id])
        instrument.name = params[:name].to_s
        instrument.model = params[:model].to_s
        instrument.price = params[:price]
        instrument.img_url = params[:img_url].to_s
        instrument.status = params[:status].to_s
        instrument.description = params[:description].to_s
        info = instrument.save ? 'success' : '更新失败'
      rescue ActiveRecord::RecordNotFound
        logger.error '更新不存在的数据'
        info = '不存在的数据'
      rescue Exception => e
        logger.error e.to_s
        info = "更新异常"
      end
      render :text => get_result(info)
  end

# POST /admin/instruments/delete
    def delete
          begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Instrument.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)     
    end
    
  # PATCH/PUT /instruments/1
  # PATCH/PUT /instruments/1.json
 def update  
    end

  # DELETE /instruments/1
  # DELETE /instruments/1.json
  def destroy
    @instrument.destroy
    respond_to do |format|
      format.html { redirect_to instruments_url, notice: 'Instrument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_params
      params[:instrument]
    end
end
