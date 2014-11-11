class Admin::InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:modify]
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
  
    # POST /instruments
  # POST /instruments.json
 def create
			@instrument = Instrument.new(instrument_params)
			uploaded_io = params[:photoImg]
			if uploaded_io.nil? == false
			name=getFileName(uploaded_io)
			File.open(Rails.root.join('app','assets', 'images', name), 'wb') do |file|
			file.write(uploaded_io.read)
			end
			@instrument.img_url=name
			end
			info = @instrument.save ? 'success' : '添加失败'
			render :text => get_result(info)
			end
  
  #POST /admin/instruments/1/modify
  def modify
          uploaded_io = params[:photoImg]
      if uploaded_io.nil? == false
        name=getFileName(uploaded_io)
          File.open(Rails.root.join('app','assets', 'images', name), 'wb') do |file|
          file.write(uploaded_io.read)  
          end
          @instrument.img_url = name
      end
      info = @instrument.update(instrument_params) ? 'success' : '更新失败'
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
  

  private
    def getFileName(uploaded_io)
    if uploaded_io.nil? == false
        @strs=uploaded_io.content_type.to_s.split("/")
   @time=Time.new.to_s
   @fileName=@time+'.'+@strs[1]
    return @fileName
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_params
      params.permit(:name, :model, :price, :description, :status,:user_id,:institution_id)
    end
end
