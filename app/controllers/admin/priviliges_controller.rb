class Admin::PriviligesController < ApplicationController
  before_action :set_privilige, only: [:modify]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/priviliges
  # GET /admin/priviliges.json
  def index
  end

  #GET /admin/priviliges/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    priviliges=Privilige.order("id").limit(limit).offset(start)
    count=Privilige.count :all
   render :text =>get_json(count,priviliges.to_json)
  end
  
    # POST /priviliges
  # POST /priviliges.json
  def create
        @privilige = Privilige.new(privilige_params)
    info = @privilige.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/priviliges/1/modify
  def modify
      info = @privilige.update(privilige_params) ? 'success' : '更新失败'
      render :text => get_result(info)
  end

# POST /admin/priviliges/delete
 def delete
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Privilige.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privilige
      @privilige = Privilige.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def privilige_params
      params.permit(:name, :description)
    end
end
