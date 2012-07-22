class App < ActiveRecord::Base
	has_and_belongs_to_many :intents

	scope :prefix, lambda { |prefix| where(["url_prefix LIKE ?", "%#{ prefix.downcase.gsub(/\s+/, '') }%"]) unless prefix.blank? }
end
