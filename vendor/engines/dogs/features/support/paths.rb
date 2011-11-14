module NavigationHelpers
  module Refinery
    module Dogs
      def path_to(page_name)
        case page_name
        when /the list of dogs/
          admin_dogs_path

         when /the new dog form/
          new_admin_dog_path
        else
          nil
        end
      end
    end
  end
end
