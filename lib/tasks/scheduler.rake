require 'rescue_groups_dot_org_client'

desc "Updating Dog Data from RescueGroups.org"
task :import_dog_data => :environment do
    puts "Updating Dog Data..."
    updated_after = RescueGroupsPull.last.present? ? RescueGroupsPull.last.created_at.to_i : nil
    RescueGroupsDotOrgClient.get_sc_dogs({:updated_after => updated_after})
    puts "Done."
end
