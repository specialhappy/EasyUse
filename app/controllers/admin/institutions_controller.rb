class Admin::InstitutionsController < ApplicationController
  before_action :set_institution, only: [:modify]
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
        @institution = Institution.new(institution_params)    
        info = @institution.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/institutions/1/modify
  def modify
      info = @institution.update(institution_params)? 'success' : '更新失败'
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
      params.permit(:name, :description, :url, :region_center_id)
    end
end
