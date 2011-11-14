class CreateDogApplicationQuestions < ActiveRecord::Migration

  def self.up
    create_table :dog_application_questions do |t|
      t.string :question_text
      t.integer :position
      t.boolean :active, :default => true
      t.timestamps
    end

    add_index :dog_application_questions, :id

    load(Rails.root.join('db', 'seeds', 'dog_application_questions.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "dog_application_questions"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/dog_application_questions"})
    end

    drop_table :dog_application_questions
  end

end
