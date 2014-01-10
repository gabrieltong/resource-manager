class GbReposController < ApplicationController
  # GET /gb_repos
  # GET /gb_repos.json
  def index
    if @user
      @relation = @user.gb_repos
    elsif @tag
      @relation = GbRepo.tagged_with @tag.name
    else
      @relation =  GbRepo.where(true)
    end
    @relation = @relation.order('id desc')
    paginate

  end

  # GET /gb_repos/1
  # GET /gb_repos/1.json
  def show
    @gb_repo = GbRepo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gb_repo }
    end
  end

  # GET /gb_repos/new
  # GET /gb_repos/new.json
  def new
    @gb_repo = GbRepo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gb_repo }
    end
  end

  # GET /gb_repos/1/edit
  def edit
    @gb_repo = GbRepo.find(params[:id])
  end

  # POST /gb_repos
  # POST /gb_repos.json
  def create
    @gb_repo = GbRepo.new(params[:gb_repo])

    respond_to do |format|
      if @gb_repo.save
        format.html { redirect_to @gb_repo, notice: 'Gb repo was successfully created.' }
        format.json { render json: @gb_repo, status: :created, location: @gb_repo }
      else
        format.html { render action: "new" }
        format.json { render json: @gb_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gb_repos/1
  # PUT /gb_repos/1.json
  def update
    @gb_repo = GbRepo.find(params[:id])

    respond_to do |format|
      if @gb_repo.update_attributes(params[:gb_repo])
        format.html { redirect_to @gb_repo, notice: 'Gb repo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gb_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gb_repos/1
  # DELETE /gb_repos/1.json
  def destroy
    @gb_repo = GbRepo.find(params[:id])
    @gb_repo.destroy

    respond_to do |format|
      format.html { redirect_to gb_repos_url }
      format.json { head :no_content }
    end
  end
end
