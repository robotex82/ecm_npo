module Ecm
  module Npo
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Copies the locale files to your application"

        source_root File.expand_path('../../../../../../config/locales', __FILE__)
        
        def generate_locales
          copy_file "ecm.npo.en.yml", "config/locales/ecm.npo.en.yml"
          copy_file "ecm.npo.de.yml", "config/locales/ecm.npo.de.yml"
        end   
      end
    end
  end
end        
