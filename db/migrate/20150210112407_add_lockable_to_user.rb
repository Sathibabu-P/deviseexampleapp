class AddLockableToUser < ActiveRecord::Migration
   def up     
      add_column :users, :failed_attempts,:integer,null: false, default: 0 
      add_column :users, :unlock_token, :datetime     
      add_column :users, :locked_at, :datetime     
     

      add_index :users, :unlock_token, :unique => true

      
   end

    def down
      remove_column :users, :failed_attempts, :unlock_token, :locked_at
      # remove_column :users, :unconfirmed_email # Only if using reconfirmable
    end
end
