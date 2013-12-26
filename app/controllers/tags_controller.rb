class TagsController < ApplicationController
  def index
    if @user
      @relation = @user.owned_tags
    else
      @relation =  ActsAsTaggableOn::Tag.where(true)
    end
    paginate
  end

  def show
  	@tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  def add
    if params['type']=='GbRepo'
      model_class = GbRepo
    end

    taggable = model_class.find(params[:id])
    render :json=>User.first.tag(taggable,:with=>params[:tags],:on=>:menus)
  end

  def prefetch
    render :json=>['a','ccc']
  end
end
