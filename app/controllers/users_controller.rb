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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

  def import_stared_gb_repos
    p '.'*100
    p @user.gb_users.first
    @user.gb_users.first.try(:import_stared_gb_repos)
    redirect_to request.referer
  end

  def import_gists
    @user.gb_users.first.try(:import_gists)
    redirect_to request.referer
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
