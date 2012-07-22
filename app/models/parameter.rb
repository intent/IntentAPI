class Parameter < ActiveRecord::Base
	has_and_belongs_to_many :intents

  attr_accessible :name, :content, :intent_ids
end
