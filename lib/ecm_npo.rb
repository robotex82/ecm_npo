require 'date_validator'
require 'rails_sql_views'
require 'citier'
require 'money-rails'

require 'ecm/npo/engine'
require 'ecm/npo/configuration'
require 'ecm/npo/routing'

module Ecm
  module Npo
    extend Configuration

    def self.table_name_prefix
      'ecm_npo_'
    end
  end
end
