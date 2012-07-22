class App < ActiveRecord::Base
	has_many :app_intent_datum
	has_many :intents, :through => :app_intent_datum

	scope :prefix, lambda { |prefix| where(["url_prefix LIKE ?", "%#{ prefix.downcase.gsub(/\s+/, '') }%"]) unless prefix.blank? }
end
