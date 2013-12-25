class TagsController < ApplicationController
  def index
    if @user
      @relation = @user.owned_tags
    else
      @relation =  ActsAsTaggableOn::Tag.where(true)
    end
    paginate
  end
end
