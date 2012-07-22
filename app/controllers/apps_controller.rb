class AppsController < ApplicationController
  
  # GET /app
  # Returns list of all registered Apps
  # Responds to both HTML and JSON formats.
  # JSON format has not been strictly defined, so it returns all values
  def index
    @apps = App.prefix(params[:prefix])
    
    respond_to do |format|
      format.html
      format.json { render json: @apps }
    end
  end

  # GET /app/:id
  # Returns specific App given :id parameter
  def show
    @app = App.find(params[:id])
  end

  # GET /app/new
  # Creates a new App instance, does not save yet
  def new
    @app = App.new
  end

  # POST /app
  # Takes the new App instance, saves it to database, redirects to App#show page
  def create
    @app = App.new(params[:app])
    if @app.save
      redirect_to @app, :notice => "Successfully created app."
    else
      render :action => 'new'
    end
  end

  # GET /app/:id/edit
  # Edit the App with particular :id passed in parameter
  def edit
    @app = App.find(params[:id])
  end

  # POST /app/:id
  # Updates the App being editing in App#edit(:id)
  def update
    @app = App.find(params[:id])
    if @app.update_attributes(params[:app])
      redirect_to @app, :notice  => "Successfully updated app."
    else
      render :action => 'edit'
    end
  end

  # DELETE /app/:id
  # Destroys the App, redirects to App#Index
  def destroy
    @app = App.find(params[:id])
    @app.destroy
    redirect_to apps_url, :notice => "Successfully destroyed app."
  end
end
