class DogApplicationQuestionsController < ApplicationController

  before_filter :find_all_dog_application_questions
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @dog_application_question in the line below:
    present(@page)
  end

  def show
    @dog_application_question = DogApplicationQuestion.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @dog_application_question in the line below:
    present(@page)
  end

protected

  def find_all_dog_application_questions
    @dog_application_questions = DogApplicationQuestion.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/dog_application_questions").first
  end

end
