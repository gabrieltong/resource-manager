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
end
