# This migration comes from ecm_npo_engine (originally 4)
class CreateEcmNpoEventDocuments < ActiveRecord::Migration
  def change
    create_table :ecm_npo_event_documents do |t|
      t.timestamp :point_in_time

      # citier
      t.string :type

      t.timestamps
    end
  end
end

