class AppIntentDatum < ActiveRecord::Base
	belongs_to :app
	belongs_to :intent

	# Used in JSON query to find an Intent with a particular name
	# If none is found, it returns an empty set.
	scope :intent_is_named, lambda { |name|
		if ( Intent.find_by_name(name) )
			where (["intent_id = ?", Intent.find_by_name(name).id])
		else
			where (["intent_id = ?", nil])
		end
	}

	# Used in JSON query to find an App with a particular URL prefix
	# If none is found, it returns an empty set.
	scope :has_prefix, lambda { |prefix|
		if ( App.find_by_url_prefix(prefix) )
			where (["app_id = ?", App.find_by_url_prefix(prefix).id])
		else
			where (["app_id = ?", nil])
		end
	}

	# Specifies how the JSON call will format the response
	def as_json(options={})
	  super(:only => [:name],
	        :include => {
	          :app => {:only => [:name, :description, :url_prefix]},
	          :intent => {:only => [:name]},
	          :param_map => {:only => [:name, :content]}
	        }
	  )
	end

	# Little helper to list all Parameters given a particular Intent
	# Used in the as_json formatting call for AppIntentData
	def param_map
		intent.parameters
	end
end
