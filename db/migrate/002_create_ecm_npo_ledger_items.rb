class CreateEcmNpoLedgerItems < ActiveRecord::Migration
  def change
    create_table :ecm_npo_ledger_items do |t|
      t.string :identifier
      t.timestamp :issued_at
      t.text :description

      # citier
      t.string :inheritance_column_name

      # money
      t.string :gross_amount_cents
      t.string :gross_amount_currency

      # associations
      t.integer :issuer_id
      t.string :issuer_type
      t.integer :recipient_id
      t.string :recipient_type

      t.timestamps
    end
  end
end

