class AppIntentDatum < ActiveRecord::Base
	belongs_to :app
	belongs_to :intent

		scope :intent_name, lambda { |intent| where(["intent LIKE ?", "%#{ intent.downcase.gsub(/\s+/, '') }%"]) unless intent.blank? }
end
