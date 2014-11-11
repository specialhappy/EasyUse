class Admin::RegionCentersController < ApplicationController
  before_action :set_region_center, only: [:modify]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/region_centers
  # GET /admin/region_centers.json
  def index
  end

  #GET /admin/region_centers/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    region_centers=RegionCenter.order("id").limit(limit).offset(start)
    count=RegionCenter.count :all
   render :text =>get_json(count,region_centers.to_json)
  end
  
    # POST /region_centers
  # POST /region_centers.json
  def create
        @region_center = RegionCenter.new(region_center_params)
    info = @region_center.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/region_centers/1/modify
  def modify
        info = @region_center.update(region_center_params) ? 'success' : '更新失败'
      render :text => get_result(info)
  end

# POST /admin/region_centers/delete
 def delete
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      RegionCenter.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region_center
      @region_center = RegionCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_center_params
      params.permit(:name, :description, :url)
    end
end
