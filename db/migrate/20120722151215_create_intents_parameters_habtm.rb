class CreateIntentsParametersHabtm < ActiveRecord::Migration
  def up
  	create_table :intents_parameters, :id => false do |t|
      t.references :intent
      t.references :parameter
    end
  end

  def down
  	drop_table :intents_parameters
  end
end
