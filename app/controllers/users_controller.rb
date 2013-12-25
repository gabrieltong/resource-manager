class UsersController < ApplicationController
  before_filter :find_user
  skip_before_filter :find_user,:only=>[:index]
    
  # caches_action :index
  def index
    @relation = User.where(true)
    paginate
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def edit
  end

  def collected_laws
    if params[:law_id] == nil
      @relation = Collect.roots current_user, Law
    else
      @relation = Collect.children current_user , Law.find(params[:id])
    end
    paginate
    render 'laws/index'
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
