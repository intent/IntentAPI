class AppsController < ApplicationController
  def index
    @apps = App.all
    
    respond_to do |format|
      format.html
      format.json { render json: @apps }
    end
  end

  def show
    @app = App.find(params[:id])
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(params[:app])
    if @app.save
      redirect_to @app, :notice => "Successfully created app."
    else
      render :action => 'new'
    end
  end

  def edit
    @app = App.find(params[:id])
  end

  def update
    @app = App.find(params[:id])
    if @app.update_attributes(params[:app])
      redirect_to @app, :notice  => "Successfully updated app."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @app = App.find(params[:id])
    @app.destroy
    redirect_to apps_url, :notice => "Successfully destroyed app."
  end
end
