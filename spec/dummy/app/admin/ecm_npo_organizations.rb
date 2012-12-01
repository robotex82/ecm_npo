ActiveAdmin.register Ecm::Npo::Organization do
  index do
    selectable_column
    column :name
    column :is_self
    column :account_balance
    default_actions
  end

  show do
    panel Ecm::Npo::Member.human_attribute_name(:issued_claims) do
      table_for resource.issued_claims, :i18n => Ecm::Npo::LedgerItems::Claim do
        column :identifier
        column :issued_at
        column :gross_amount
        column :paid?
        column :recipient
      end
    end

    panel Ecm::Npo::Organization.human_attribute_name(:recieved_payments) do
      table_for resource.recieved_payments, :i18n => Ecm::Npo::LedgerItems::Payment do
        column :identifier
        column :issued_at
        column :gross_amount
        column :issuer
      end
    end
  end

  sidebar Ecm::Npo::Organization.human_attribute_name(:details), :only => :show do
    attributes_table_for resource do
      row :name
      row :is_self
      row :account_balance
      row :created_at
      row :updated_at
    end
  end  
end
