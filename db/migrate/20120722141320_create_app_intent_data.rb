class CreateAppIntentData < ActiveRecord::Migration
  def change
    create_table :app_intent_data do |t|
    	t.references :app
    	t.references :intent
    	
      t.timestamps
    end
  end
end
