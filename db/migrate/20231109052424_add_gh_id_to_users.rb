class AddGhIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gh_id, :string
    add_column :users, :gh_username, :string
    add_column :users, :gh_token, :string
  end
end
