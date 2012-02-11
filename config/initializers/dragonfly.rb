# http://markevans.github.com/dragonfly/file.Rails3.html

# NOTE: hoping this is only needed for local rails development.  RefineryCMS should handle dragonfly / heroku config
unless Rails.env.production?
  require 'dragonfly'
  app = Dragonfly[:images]
  app.configure_with(:imagemagick)
  app.configure_with(:rails)
  app.define_macro(ActiveRecord::Base, :image_accessor)
end