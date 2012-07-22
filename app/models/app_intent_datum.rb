class AppIntentDatum < ActiveRecord::Base
	belongs_to :app
	belongs_to :intent

	scope :intent_name, lambda { |intent| where(["intent LIKE ?", "%#{ intent.downcase.gsub(/\s+/, '') }%"]) unless intent.blank? }

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
