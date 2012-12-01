class CreateEcmNpoLedgerItemsPayments < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create the views
    create_citier_view(Ecm::Npo::LedgerItems::Payment) if direction == :up
    drop_citier_view(Ecm::Npo::LedgerItems::Payment) if direction == :down
  end
    
  def change
    create_table :ecm_npo_ledger_items_payments do |t|
      t.references :claim
    end
  end
end

