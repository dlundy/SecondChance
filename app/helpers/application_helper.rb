module ApplicationHelper
  
  def event_address(event)
    %{<div class="address">
        <span class="address_1">#{event.address_1}</span>
        <span class="address_2">#{event.address_2}</span>
        <span class="city">#{event.city}</span>
        <span class="state">#{event.state}</span>
        <span class="zipcode">#{event.zipcode} 
        <span class="website">#{event.website}</span>
      </div> 
      }
  end
  
  def event_inline_listing(event)
    "#{event.title}&nbsp;#{event.start_at.strftime("%A %b %d %I:%M%p")}&nbsp;#{event.address_1}"
  end
  
  def event_inline_date(event)
    event.start_at.strftime("%A %b %d %I:%M%p") + ' - ' + event.end_at.strftime("%A %b %d %I:%M%p")
  end
  
end
