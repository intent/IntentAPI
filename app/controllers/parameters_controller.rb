class ParametersController < ApplicationController
  def index
    @parameters = Parameter.all
  end

  def show
    @parameter = Parameter.find(params[:id])
  end

  def new
    @parameter = Parameter.new
  end

  def create
    @parameter = Parameter.new(params[:parameter])
    if @parameter.save
      redirect_to @parameter, :notice => "Successfully created parameter."
    else
      render :action => 'new'
    end
  end

  def edit
    @parameter = Parameter.find(params[:id])
  end

  def update
    @parameter = Parameter.find(params[:id])
    if @parameter.update_attributes(params[:parameter])
      redirect_to @parameter, :notice  => "Successfully updated parameter."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @parameter = Parameter.find(params[:id])
    @parameter.destroy
    redirect_to parameters_url, :notice => "Successfully destroyed parameter."
  end
end
