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
  :email => "test@example.com",
  :description => "Great little Greek place. Prefer to go for lunch over breakfast, but that's just me. The avgolemono soup is killer and less than $4. Bunch of tables and some outside space to sit. They make some good stuff."
})

sample_event2 = Event.create({
  :title => "Sample Event 2",
  :start_at => "2012-05-20 12:00:00",
  :end_at => "2012-05-20 15:00:00",
  :address_1 => "3055 Harding Street",
  :city => "Carlsbad",
  :state => "CA",
  :zipcode => 92008,
  :email => "test@example.com",
  :description => "This place never seems to disappoint. For the most part, I stick with the #11 (chicken enchiladas with green sauce); consistently good! The staff has always been friendly and efficient. We'll continue to come back again and again."
})

sample_event3 = Event.create({
  :title => "Sample Event 3",
  :start_at => "2012-08-07 09:00:00",
  :end_at => "2012-08-07 11:00:00",
  :address_1 => "3504 College Blvd",
  :city => "Oceanside",
  :state => "CA",
  :zipcode => 92056,
  :email => "test@example.com",
  :description => "The breakfast burrito here is large, cheap, and good.  That's the triumvirate we should all look for with anything but moreso with breakfast burritos.  Crispy almost charred bacon, ham, eggs and french fries make up this top shelf burrito.  The salsa verde is several degrees hotter than their red salsa so go with the verde."
})