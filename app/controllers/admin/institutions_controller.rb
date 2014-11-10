class Admin::InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show, :edit, :update, :destroy]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/institutions
  # GET /admin/institutions.json
  def index
  end

  #GET /admin/institutions/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    institutions=Institution.order("id").limit(limit).offset(start)
    count=Institution.count :all
   render :text =>get_json(count,institutions.to_json)
  end
  
    # POST /institutions
  # POST /institutions.json
  def create
        @institution = Institution.new(:name => params[:name].to_s,:url => params[:url].to_s,:description => params[:description].to_s,:region_center_id => params[:region_center_id].to_s)
    info = @institution.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/institutions/1/modify
  def modify
    begin
 institution = Institution.find(params[:id])
      institution.name = params[:name].to_s
      institution.description = params[:description].to_s
      institution.url = params[:url].to_s
      institution.region_center_id = params[:region_center_id].to_s
        info = institution.save ? 'success' : '更新失败'
      rescue ActiveRecord::RecordNotFound
        logger.error '更新不存在的数据'
        info = '不存在的数据'
      rescue Exception => e
        logger.error e.to_s
        info = "更新异常"
      end
      render :text => get_result(info)
  end

# POST /admin/institutions/delete
 def delete
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Institution.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institution
      @institution = Institution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institution_params
      params[:institution]
    end
end
