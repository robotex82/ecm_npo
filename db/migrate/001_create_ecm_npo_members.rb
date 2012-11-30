class CreateEcmNpoMembers < ActiveRecord::Migration
  def change
    create_table :ecm_npo_members do |t|
      t.string :firstname
      t.string :nickname
      t.string :lastname
      t.date :birthdate

      # associations
      t.references :user

      # friendly id
      t.string :slug

      t.timestamps
    end
    add_index :ecm_npo_members, :user_id
  end
end

