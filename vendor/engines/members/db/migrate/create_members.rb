class CreateMembers < ActiveRecord::Migration

  def self.up
    create_table :members do |t|
      t.string :email, :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      t.string :password_salt
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.string   :confirmation_token
      t.datetime :confirmed_at                                   
      t.datetime :confirmation_sent_at                           
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :phone
      t.string :description
      t.integer :position
      t.timestamps
    end
    add_index :members, :id
    add_index :member, :email
  end
  
  ## DEVISE COLUMNS
  ## Database authenticatable
  #  t.string :email,              :null => false, :default => ""
  #  t.string :encrypted_password, :null => false, :default => ""
  # 
  #  ## Recoverable
  #  t.string   :reset_password_token
  #  t.datetime :reset_password_sent_at
  # 
  #  ## Rememberable
  #  t.datetime :remember_created_at
  # 
  #  ## Trackable
  #  t.integer  :sign_in_count, :default => 0
  #  t.datetime :current_sign_in_at
  #  t.datetime :last_sign_in_at
  #  t.string   :current_sign_in_ip
  #  t.string   :last_sign_in_ip
  # 
  #  ## Encryptable
  #  # t.string :password_salt
  # 
  #  ## Confirmable
  #  # t.string   :confirmation_token
  #  # t.datetime :confirmed_at
  #  # t.datetime :confirmation_sent_at
  #  # t.string   :unconfirmed_email # Only if using reconfirmable
  # 
  #  ## Lockable
  #  # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
  #  # t.string   :unlock_token # Only if unlock strategy is :email or :both
  #  # t.datetime :locked_at
  # 
  #  ## Token authenticatable
  #  # t.string :authentication_token

  

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "members"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/members"})
    end

    drop_table :members
  end

end
