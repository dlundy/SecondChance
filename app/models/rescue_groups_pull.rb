class RescueGroupsPull < ActiveRecord::Base
  
  def get_unix_timestamp
    created_at.to_time.to_i
  end

end
