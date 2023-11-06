class CreateTempUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :temp_users do |t|
      t.string :name
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
