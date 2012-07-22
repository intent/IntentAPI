class IntentsController < ApplicationController

  # Review Apps_Controller for detailed documentation on each function call
  # The same calls apply here to Intents. Just basic CRUD.

  def index
    @intents = Intent.search(params[:name])

    respond_to do |format|
      format.html
      format.json { render json: @intents }
    end
  end

  def show
    @intent = Intent.find(params[:id])
  end

  def new
    @intent = Intent.new
  end

  def create
    @intent = Intent.new(params[:intent])
    if @intent.save
      redirect_to @intent, :notice => "Successfully created intent."
    else
      render :action => 'new'
    end
  end

  def edit
    @intent = Intent.find(params[:id])
  end

  def update
    @intent = Intent.find(params[:id])
    if @intent.update_attributes(params[:intent])
      redirect_to @intent, :notice  => "Successfully updated intent."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @intent = Intent.find(params[:id])
    @intent.destroy
    redirect_to intents_url, :notice => "Successfully destroyed intent."
  end
end
