class AddStateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :state, :string, null: false

    add_index :users, :state
  end
end
