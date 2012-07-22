class AppIntentDataController < ApplicationController
	def index
		@data = AppIntentDatum.all

		respond_to do |format|
    	format.json { render json: @data }
    end
	end
end
