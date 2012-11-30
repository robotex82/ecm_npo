class CreateEcmNpoLedgerItems < ActiveRecord::Migration
  def change
    create_table :ecm_npo_ledger_items do |t|
      t.string :identifier
      t.timestamp :issued_at
      t.text :description

      # citier
      t.string :type

      # money
      t.integer :gross_amount_cents
      t.string :currency

      # associations
      t.integer :issuer_id
      t.string :issuer_type
      t.integer :recipient_id
      t.string :recipient_type

      t.timestamps
    end
  end
end

