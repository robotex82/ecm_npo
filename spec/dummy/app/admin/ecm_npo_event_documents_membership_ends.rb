ActiveAdmin.register Ecm::Npo::EventDocuments::MembershipEnd do
  form do |f|                         
    f.inputs do       
      f.input :member
      f.input :point_in_time, :as => :datepicker
    end                               
    f.actions                         
  end   
end
