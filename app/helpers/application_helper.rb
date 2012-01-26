module ApplicationHelper

  def event_address(event)
    %{<div class="address">
        <div class="line-1">
          <span class="address_1">#{event.address_1}</span>
          <span class="address_2">#{event.address_2}</span>
        </div>
        <div class="line-2">
          <span class="city">#{event.city},</span>
          <span class="state">#{event.state}</span>
          <span class="zipcode">#{event.zipcode} 
          <span class="website">#{event.website}</span>
        </div>
      </div> 
      }
  end

  def event_inline_listing(event)
    "#{event.title}&nbsp;#{event.start_at.strftime("%A %b %d %I:%M%p")}&nbsp;#{event.address_1}"
  end

  def event_inline_date(event)
    on_same_day =
      event.start_at.month == event.end_at.month and
      event.start_at.year == event.end_at.year and
      event.start_at.day == event.end_at.day

    if on_same_day
      end_time_formatted = event.end_at.strftime("%l:%M%p")
    else
      end_time_formatted = event.end_at.strftime("%a, %b %d %l:%M%p")
    end

    event.start_at.strftime("%a, %b %d %l:%M%p") + ' - ' + end_time_formatted
  end

end
