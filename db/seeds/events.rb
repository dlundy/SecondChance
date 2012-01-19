if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'events').blank?
      user.plugins.create(:name => 'events',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Events',
    :link_url => '/events',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/events(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end

sample_event = Event.create({
  :title => "Sample Event",
  :start_at => "2012-03-15 10:00:00",
  :end_at => "2012-03-15 12:00:00",
  :address_1 => "2440 S Melrose Dr",
  :address_2 => "#100",
  :city => "Vista",
  :state => "CA",
  :zipcode => 92081,
  :email => "test@example.com"
})

sample_event2 = Event.create({
  :title => "Sample Event 2",
  :start_at => "2012-05-20 12:00:00",
  :end_at => "2012-05-20 15:00:00",
  :address_1 => "3055 Harding Street",
  :city => "Carlsbad",
  :state => "CA",
  :zipcode => 92008,
  :email => "test@example.com"
})

sample_event3 = Event.create({
  :title => "Sample Event 3",
  :start_at => "2012-08-07 09:00:00",
  :end_at => "2012-08-07 11:00:00",
  :address_1 => "3504 College Blvd",
  :city => "Oceanside",
  :state => "CA",
  :zipcode => 92056,
  :email => "test@example.com"
})