module NavigationHelpers
  module Refinery
    module Labels
      def path_to(page_name)
        case page_name
        when /the list of labels/
          admin_labels_path

         when /the new label form/
          new_admin_label_path
        else
          nil
        end
      end
    end
  end
end
