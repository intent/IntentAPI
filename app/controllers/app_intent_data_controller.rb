class AppIntentDataController < ApplicationController
	def index
		# @data = AppIntentDatum.find(:all, :include => :intent, :conditions => ["intent_id = ?", Intent.find_by_name(params[:intent_name]).id ])
		@data = AppIntentDatum.intent_is_named(params[:intent_name]).has_prefix(params[:prefix])

		respond_to do |format|
    	format.json { render json: @data }
    end
	end
end
