ActiveAdmin.register Ecm::Npo::LedgerItems::Claim do
  form do |f|                         
    f.inputs do   
      f.input :identifier
      f.input :issued_at, :as => :datepicker
      f.input :gross_amount
      f.input :issuer_type, :collection => [Ecm::Npo::Member, Ecm::Npo::Organization].map(&:to_s).collect { |i| [ i.demodulize, i ] }
      f.input :issuer, :collection => [Ecm::Npo::Member.all, Ecm::Npo::Organization.all].flatten.collect { |i| [ i, i.id ] }
      f.input :recipient_type, :collection => [Ecm::Npo::Member, Ecm::Npo::Organization].map(&:to_s).collect { |i| [ i.demodulize, i ] }
      f.input :recipient, :collection => [Ecm::Npo::Member.all, Ecm::Npo::Organization.all].flatten.collect { |i| [ i, i.id ] }
      f.input :description
    end                               
    f.actions                         
  end   
end
