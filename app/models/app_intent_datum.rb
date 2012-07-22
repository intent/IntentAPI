class AppIntentDatum < ActiveRecord::Base
	belongs_to :app
	belongs_to :intent

	scope :intent_is_named, lambda { |name|
		if ( Intent.find_by_name(name) )
			where (["intent_id = ?", Intent.find_by_name(name).id])
		else
			where (["intent_id = ?", nil])
		end
	}

		scope :has_prefix, lambda { |prefix|
		if ( App.find_by_url_prefix(prefix) )
			where (["app_id = ?", App.find_by_url_prefix(prefix).id])
		else
			where (["app_id = ?", nil])
		end
	}


	# scope :url_prefix, lambda { |prefix| where(["prefix LIKE ?", "%#{ prefix.downcase.gsub(/\s+/, '') }%"]) unless url_prefix.blank? }

	def as_json(options={})
	  super(:only => [:name],
	        :include => {
	          :app => {:only => [:name, :description, :url_prefix]},
	          :intent => {:only => [:name]},
	          :param_map => {:only => [:name, :content]}
	        }
	  )
	end

	def param_map
		intent.parameters
	end
end
