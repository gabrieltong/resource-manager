class GbUsersController < ApplicationController
  # GET /gb_users
  # GET /gb_users.json
  def index
    if @user
      @relation = @user.gb_repos
    else
      @relation =  GbUser.where(true)
    end
    paginate
  end

  # GET /gb_users/1
  # GET /gb_users/1.json
  def show
    @gb_user = GbUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gb_user }
    end
  end

  # GET /gb_users/new
  # GET /gb_users/new.json
  def new
    @gb_user = GbUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gb_user }
    end
  end

  # GET /gb_users/1/edit
  def edit
    @gb_user = GbUser.find(params[:id])
  end

  # POST /gb_users
  # POST /gb_users.json
  def create
    @gb_user = GbUser.new(params[:gb_user])

    respond_to do |format|
      if @gb_user.save
        format.html { redirect_to @gb_user, notice: 'Gb user was successfully created.' }
        format.json { render json: @gb_user, status: :created, location: @gb_user }
      else
        format.html { render action: "new" }
        format.json { render json: @gb_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gb_users/1
  # PUT /gb_users/1.json
  def update
    @gb_user = GbUser.find(params[:id])

    respond_to do |format|
      if @gb_user.update_attributes(params[:gb_user])
        format.html { redirect_to @gb_user, notice: 'Gb user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gb_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gb_users/1
  # DELETE /gb_users/1.json
  def destroy
    @gb_user = GbUser.find(params[:id])
    @gb_user.destroy

    respond_to do |format|
      format.html { redirect_to gb_users_url }
      format.json { head :no_content }
    end
  end
end
