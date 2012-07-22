class AppIntentDatum < ActiveRecord::Base
	belongs_to :app
	belongs_to :intent
end
