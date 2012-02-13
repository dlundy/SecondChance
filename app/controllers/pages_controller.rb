class PagesController < ApplicationController

  # This action is usually accessed with the root path, normally '/'
  def home
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
    # if time_to_refresh?
    #   updated_after = RescueGroupsPull.last.present? ? RescueGroupsPull.last.created_at.to_i : nil
    #   Delayed::Job.enqueue(UpdateScDbJob.new(DOG_IMPORT_LIMIT, {:updated_after => updated_after}))
    # end
    if params[:search_text].present? 
      @dogs = Dog.active.search(params[:search_text].downcase).paginate({:page => dpage, :per_page => 12})
    else  
      @dogs = Dog.active.paginate({:page => dpage, :per_page => 12})
    end
    @events = Event.upcoming.order('start_at ASC')
  end

  # This action can be accessed normally, or as nested pages.
  # Assuming a page named "mission" that is a child of "about",
  # you can access the pages with the following URLs:
  #
  #   GET /pages/about
  #   GET /about
  #
  #   GET /pages/mission
  #   GET /about/mission
  #
  def show
    @page = Page.find("#{params[:path]}/#{params[:id]}".split('/').last)
    if @page.try(:live?) || (refinery_user? && current_user.authorized_plugins.include?("refinery_pages"))
      # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
      if @page.skip_to_first_child && (first_live_child = @page.children.order('lft ASC').live.first).present?
        redirect_to first_live_child.url and return
      elsif @page.link_url.present?
        redirect_to @page.link_url and return
      end
    else
      error_404
    end
  end
  
  private
  
  # def time_to_refresh?
  #   !RescueGroupsPull.last.present? || RescueGroupsPull.last.created_at < 1.day.ago
  # end

end
