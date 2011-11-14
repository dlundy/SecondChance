module Admin
  class DogApplicationQuestionsController < Admin::BaseController

    crudify :dog_application_question,
            :title_attribute => 'question_text', :xhr_paging => true

  end
end
