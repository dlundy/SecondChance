DOG_APPLICATION_FORM_URL = 'http://www.formspring.com/forms/?886457-oDRwG4qugN'
DOG_IMPORT_LIMIT = 300

HOSTNAME = ENV['SC_HOSTNAME']

ActionMailer::Base.default_url_options[:host] = ENV['SC_HOSTNAME']