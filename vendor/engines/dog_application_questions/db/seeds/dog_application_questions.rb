if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'dog_application_questions').blank?
      user.plugins.create(:name => 'dog_application_questions',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Dog Application Questions',
    :link_url => '/dog_application_questions',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/dog_application_questions(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end