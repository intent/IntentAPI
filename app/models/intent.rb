class Intent < ActiveRecord::Base
	has_many :app_intent_datum
	has_many :apps, :through => :app_intent_datum
	has_and_belongs_to_many :parameters

	scope :search, lambda { |query| where(["name LIKE ?", "%#{ query.downcase.gsub(/\s+/, '') }%"]) unless query.blank? }

	def as_json(options={})
	  super(:only => [:name],
	        :include => {
	          :apps => {:only => [:url_prefix]}
	        }
	  )
	end
end
