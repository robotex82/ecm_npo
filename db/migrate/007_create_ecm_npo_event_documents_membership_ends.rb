class CreateEcmNpoEventDocumentsMembershipEnds < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create the views
    create_citier_view(Ecm::Npo::EventDocuments::MembershipEnd) if direction == :up
    drop_citier_view(Ecm::Npo::EventDocuments::MembershipEnd) if direction == :down
  end
    
  def change
    create_table :ecm_npo_event_documents_membership_ends do |t|
      t.references :member
      t.references :membership_begin
    end
  end
end

