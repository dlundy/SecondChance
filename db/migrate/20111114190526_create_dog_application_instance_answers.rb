class CreateDogApplicationInstanceAnswers < ActiveRecord::Migration
  def self.up
    create_table :dog_application_instance_answers do |t|
      t.integer :dog_application_instance_id, :null => false
      t.integer :dog_application_question_id, :null => false
      t.string :answer
      t.timestamps
    end
    add_index :dog_application_instance_answers, :dog_application_instance_id, :name => 'dog_app_instance_id_idx'
    add_index :dog_application_instance_answers, :dog_application_question_id, :name => 'dog_app_question_id_idx'
  end

  def self.down
    drop_table :dog_application_instance_answers
  end
end
