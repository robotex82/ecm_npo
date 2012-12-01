class CreateEcmNpoOrganizations < ActiveRecord::Migration
  def change
    create_table :ecm_npo_organizations do |t|
      t.string :name
      t.boolean :is_self
      t.text :description

      t.timestamps
    end
  end
end

