class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :string
    remove_column :users, :confirmation_sent_at, :string
  end
end
