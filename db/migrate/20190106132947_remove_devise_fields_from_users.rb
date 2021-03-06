class RemoveDeviseFieldsFromUsers < ActiveRecord::Migration[5.1]
  def change
    # Database authenticatable
    remove_column :users, :email, :string
    remove_column :users, :encrypted_password, :string

    # Recoverable
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime

    # Rememberable
    remove_column :users, :remember_created_at, :datetime

    # Confirmable
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :unconfirmed_email, :string

    # Trackable
    remove_column :users, :sign_in_count, :integer
    remove_column :users, :current_sign_in_at, :datetime
    remove_column :users, :last_sign_in_at, :datetime
    remove_column :users, :current_sign_in_ip, :string
    remove_column :users, :last_sign_in_ip, :string

    remove_column :users, :full_name, :string
  end
end
