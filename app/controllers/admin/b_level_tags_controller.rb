class Admin::BLevelTagsController < ApplicationController
before_action :set_b_level_tag, only: [:modify]
  layout 'adminlayout'
  protect_from_forgery :only => :index
  # GET /admin/b_level_tags
  # GET /admin/b_level_tags.json
  def index
  end

  #GET /admin/b_level_tags/list
  def list
    start=params[:start].to_i
    limit=params[:limit].to_i
    b_level_tags=BLevelTag.order("id").limit(limit).offset(start)
    count=BLevelTag.count :all
   render :text =>get_json(count,b_level_tags.to_json)
  end
  
    # POST /b_level_tags
  # POST /b_level_tags.json
  def create
        @b_level_tag = BLevelTag.new(b_level_tag_params)
    info = @b_level_tag.save ? 'success' : '添加失败' 
   render :text => get_result(info)
  end
  
  #POST /admin/b_level_tags/1/modify
  def modify
      info = @b_level_tag.update(b_level_tag_params) ? 'success' : '更新失败'
      render :text => get_result(info)
  end

# POST /admin/b_level_tags/delete
 def delete
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      BLevelTag.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b_level_tag
      @b_level_tag = BLevelTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def b_level_tag_params
      params.permit(:name, :description, :a_level_tag_id)
    end
end
