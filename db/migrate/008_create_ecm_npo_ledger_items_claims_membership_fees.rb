class CreateEcmNpoLedgerItemsClaimsMembershipFees < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create the views
    create_citier_view(Ecm::Npo::LedgerItems::Claims::MembershipFees) if direction == :up
    drop_citier_view(Ecm::Npo::LedgerItems::Claims::MembershipFees) if direction == :down
  end
    
  def change
    create_table :ecm_npo_ledger_items_claims_membership_fees do |t|
      t.date :begin_date
      t.date :end_date

      # associations
      t.references :member
    end
  end
end

