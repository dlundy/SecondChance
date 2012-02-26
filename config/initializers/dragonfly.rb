# http://markevans.github.com/dragonfly/file.Rails3.html

# NOTE: hoping this is only needed for local rails development.  RefineryCMS should handle dragonfly / heroku config
# unless Rails.env.production?
#   require 'dragonfly'
#   app = Dragonfly[:images]
#   app.configure_with(:imagemagick)
#   app.configure_with(:rails)
#   app.define_macro(ActiveRecord::Base, :image_accessor)
# end


# NOTE:  I will test this out on heroku and pray....

require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
app.configure do |c|
  c.allow_fetch_url = true
  c.protect_from_dos_attacks = true
  c.secret = 'bb96af149a1ce6f181b967425b159325bb611813fd547a4f5e1c94e26d3abd32'
end
app.define_macro(ActiveRecord::Base, :image_accessor)
Dragonfly::Images = app
