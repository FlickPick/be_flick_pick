class CreateUserParties < ActiveRecord::Migration[7.0]
  def change
    create_table :user_parties do |t|
      t.references :users, null: false, foreign_key: true
      t.references :parties, null: false, foreign_key: true
      t.boolean :host, default: false

      t.timestamps
    end
  end
end
