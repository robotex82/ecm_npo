module Ecm
  module Npo
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the intializer"

        source_root File.expand_path('../templates', __FILE__) 
        
        def generate_intializer
          copy_file "ecm_npo.rb", "config/initializers/ecm_npo.rb"
        end   
      end
    end
  end
end        
