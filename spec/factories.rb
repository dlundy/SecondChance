Factory.define :dog_application_instance do |dog_application_instance|
  dog_application_instance.first_name            "Jane"
  dog_application_instance.last_name             "Doe"
  dog_application_instance.email                 "jane@example.com"
  dog_application_instance.phone                 "555-555-1234"
end

Factory.define :dog_application_question do |dog_application_instance|
  dog_application_instance.question_text         "Do you have a fenced-in yard?"
end

Factory.define :dog_application_instance_answer do |dog_application_instance_answer|
  dog_application_instance_answer.answer  "yes"
  dog_application_instance_answer.association :dog_application_instance
end