module NavigationHelpers
  module Refinery
    module DogApplicationQuestions
      def path_to(page_name)
        case page_name
        when /the list of dog_application_questions/
          admin_dog_application_questions_path

         when /the new dog_application_question form/
          new_admin_dog_application_question_path
        else
          nil
        end
      end
    end
  end
end
