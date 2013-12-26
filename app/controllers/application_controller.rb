class ApplicationController < ActionController::Base
  before_filter :find_user,:find_tag,:paginate_params
  include Clearance::Controller
  protect_from_forgery

  private
  def find_user
    @user = User.find_by_id(params[:user_id])
  end

  def find_tag
    @tag = ActsAsTaggableOn::Tag.find_by_id(params[:tag_id])
  end


  # 在返回集合的api上设置分页的页数和分页大小
  # 结果：设置好 @page 和 @per_page
  def paginate_params
    @page = params[:page] || 1 
    @per_page = params[:per_page] || 100
    @random = params[:random].to_i || 0
    @per_random = params[:per_random] || 15
  end

  # 根据分页的数量
  # require @page
  # require @per_page
  # set @collection
  def paginate
    if @random == 0
      @collection = @relation.paginate(:page=>@page,:per_page=>@per_page)
    else
      @collection = @relation.random(@per_random)
    end
  end 
end
