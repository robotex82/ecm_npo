ActiveAdmin.register Ecm::Npo::LedgerItems::Claims::MembershipFee do
  form do |f|                         
    f.inputs do   
      f.input :member
      f.input :identifier
      f.input :issued_at, :as => :datepicker
      f.input :gross_amount
      f.input :issuer_type, :collection => [Ecm::Npo::Member, Ecm::Npo::Organization].map(&:to_s).collect { |i| [ i.demodulize, i ] }
      f.input :issuer, :collection => [Ecm::Npo::Member.all, Ecm::Npo::Organization.all].flatten.collect { |i| [ i, i.id ] }
      f.input :recipient_type, :collection => [Ecm::Npo::Member, Ecm::Npo::Organization].map(&:to_s).collect { |i| [ i.demodulize, i ] }
      f.input :recipient, :collection => [Ecm::Npo::Member.all, Ecm::Npo::Organization.all].flatten.collect { |i| [ i, i.id ] }
      f.input :description
      f.input :begin_date, :as => :datepicker
      f.input :end_date, :as => :datepicker
    end                               
    f.actions                         
  end   
end

