class CreateEcmNpoEventDocumentsMembershipBegins < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create the views
    create_citier_view(Ecm::Npo::EventDocuments::MembershipBegin) if direction == :up
    drop_citier_view(Ecm::Npo::EventDocuments::MembershipBegin) if direction == :down
  end
    
  def change
    create_table :ecm_npo_event_documents_membership_begins do |t|
      t.references :member
    end
  end
end

