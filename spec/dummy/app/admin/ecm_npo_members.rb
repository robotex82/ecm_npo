ActiveAdmin.register Ecm::Npo::Member do
  form do |f|                         
    f.inputs do       
      f.input :user                  
      f.input :firstname               
      f.input :nickname
      f.input :lastname
      f.input :birthdate, :as => :datepicker
    end                               
    f.actions                         
  end  

  index do
    selectable_column
    column :firstname
    column :lastname
    column :birthdate
    column :account_balance
    default_actions
  end

  show do
    panel Ecm::Npo::Member.human_attribute_name(:memberships) do
      table_for resource.memberships, :i18n => Ecm::Npo::Membership do
        column :begin_date
        column :end_date
        column :length
      end
    end

    panel Ecm::Npo::Member.human_attribute_name(:receieved_claims) do
      table_for resource.recieved_claims, :i18n => Ecm::Npo::LedgerItems::Claim do
        column :identifier
        column :issued_at
        column :gross_amount
        column :paid?
        column :issuer
      end
    end

    panel Ecm::Npo::Member.human_attribute_name(:issued_payments) do
      table_for resource.issued_payments, :i18n => Ecm::Npo::LedgerItems::Payment do
        column :identifier
        column :issued_at
        column :gross_amount
        column :recipient
      end
    end
  end

  sidebar Ecm::Npo::Member.human_attribute_name(:details), :only => :show do
    attributes_table_for resource do
      row :firstname
      row :nickname
      row :lastname
      row :user
      row :birthdate
      row :account_balance
      row :created_at
      row :updated_at
    end
  end
end
