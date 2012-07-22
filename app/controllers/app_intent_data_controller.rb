class AppIntentDataController < ApplicationController
	def index

		# Searches database for an intersection of the two sets.
		# Set 1 is all Intents with the name passed in parameter "intent_name"
		# Set 2 is all Apps with the URL prefix passed in parameter "prefix"
		@data = AppIntentDatum.intent_is_named(params[:intent_name]).has_prefix(params[:prefix])

		# Responds to JSON only. No HTML response for AppIntentDatum objects
		respond_to do |format|
    	format.json { render json: @data }
    end
	end
end
