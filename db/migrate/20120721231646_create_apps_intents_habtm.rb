class CreateAppsIntentsHabtm < ActiveRecord::Migration
  def up
  	create_table :apps_intents, :id => false do |t|
      t.references :app
      t.references :intent
    end
  end

  def down
  	drop_table :apps_intents
  end
end
