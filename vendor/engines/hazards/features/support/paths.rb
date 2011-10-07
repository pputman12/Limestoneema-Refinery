module NavigationHelpers
  module Refinery
    module Hazards
      def path_to(page_name)
        case page_name
        when /the list of hazards/
          admin_hazards_path

         when /the new hazard form/
          new_admin_hazard_path
        else
          nil
        end
      end
    end
  end
end
